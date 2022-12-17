//
//  RealmManager.swift
//  xref-ios
//
//  Created by toheeb on 6/8/22.
//

import Foundation
import RealmSwift
import SwiftUI

enum RealmErrors: Int {
    case unableToOpenRealm
}

let SCHEMA_VERSION = 2
@MainActor
public class RealmManager: NSObject, ObservableObject {
    @objc static let shared = RealmManager()
    private let app = RealmSwift.App(id: "xref-ios-prjvr")
    @Published var isLoggedIn: Bool = false
    @Published var realm: Realm?
    @Published var realmConfiguration: Realm.Configuration?
    
    let beforeClientResetBlock: (Realm) -> Void = { before in
        // This block could be used to back-up a realm file, send reporting, etc.
    }
    let afterClientResetBlock: (Realm, Realm) -> Void = { before, after in
        // This block could be used to add custom recovery logic, send reporting, etc.
    }
    
    public var currentUser: User? {
        return RealmManager.shared.app.currentUser
    }
    
    public override init() {
        super.init()
        Task {
            await self.attemptSilentLogin()
        }
    }
    
    private func attemptSilentLogin() {
        if let user = RealmManager.shared.app.currentUser {
            #if DEBUG
            print("user: \(user.id) already logged in")
            #endif
            openRealm()
        }
    }
    
    private func openRealm(completion: ((Result<Void, Error>) -> ())? = nil) {
        Task {
            try await self.openRealmWithDefault(completion: { result in
                switch result {
                case .success(()):
                    RealmManager.shared.isLoggedIn = true
                case .failure(let error):
                    completion?(.failure(error))
                    self.isLoggedIn = false
                }
            })
        }
    }
    
    public func authenticatedLogin(
        email: String,
        password: String,
        completion: @escaping (Result<Void, Error>) -> ()
    ) {
        let credentials = Credentials.emailPassword(email: email, password: password)
        login(credentials: credentials) { result in
            switch result {
            case .failure(let error):
                print("Login failed: \(error)")
                completion(.failure(error))
            case .success(let user):
                self.openRealm(completion: completion)
                print("Login succesful for user: \(user.id)")
                
            }
        }
    }
    
    public func signUp(
        email: String,
        password: String,
        completion: @escaping (Result<Void, Error>) -> ()
    ) {
        RealmManager.shared.app
            .emailPasswordAuth
            .registerUser(email: email, password: password) { (error) in
                if let possibleError = error {
                    print("Registration failed with error: \(possibleError)")
                    completion(.failure(possibleError))
                    return
                }
                // if registration is success, let's log the user in
                self.authenticatedLogin(email: email, password: password, completion: completion)
            }
    }
    
    private func login(credentials: Credentials,
                       completion: @escaping (Result<RealmSwift.User, Error>) -> ()) {
        RealmManager.shared.app.login(credentials: credentials) { completion($0) }
    }
    
    public func logout(completion: (() -> ())?) {
        RealmManager.shared.app.currentUser?.logOut {
            (error) in
            if let error = error {
                #if DEBUG
                print("logout error: \(error)")
                #endif
            }
            
            Task(priority: .userInitiated) {
                self.isLoggedIn = false
                completion?()
            }
        }
    }
    
    public func realm(for partition: String, completion: @escaping (Result<Realm, Swift.Error>) -> ()) {
        let user = RealmManager.shared.app.currentUser!
        let config = user.configuration(partitionValue: partition)
        Realm.asyncOpen(configuration: config, callbackQueue: .main, callback: completion)
    }
    
    private func migration() -> MigrationBlock {
        let migrationBlock: MigrationBlock = {
            migration, oldSchemaVersion in
            if oldSchemaVersion < SCHEMA_VERSION {
                migration.enumerateObjects(ofType: Project.className()) { oldObject, newObject in
//                    newObject!["createdAt"] = Date()
//                    newObject!["updatedAt"] = Date()
                }
            }
        }
        return migrationBlock
    }
    
    private func openRealmWithDefault(completion: ((Result<Void, Error>) -> ())?) async throws {
        do {
            var config = Realm.Configuration.defaultConfiguration
            let clientResentMode: ClientResetMode = .discardLocal(beforeClientResetBlock, afterClientResetBlock)
            if let user = RealmManager.shared.app.currentUser  {
                config = user.configuration(
                    partitionValue: "owner_id=\(user.id)",
                    clientResetMode: clientResentMode
                )
                print("attempting to open realm for user: \(user.id)")
            }
            config.schemaVersion = 1
            realmConfiguration = config
            self.realm = try await Realm(configuration: config)
            completion?( .success(()) )
        }
        catch {
            print(error)
            let myError = NSError(domain: "Realm", code: RealmErrors.unableToOpenRealm.rawValue, userInfo: ["errorMessage": error.localizedDescription])
            completion?( .failure(myError) )
        }

    }
}


