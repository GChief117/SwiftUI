//
//  LoginView.swift
//  BirdMusic
//
//  Created by Gunnar Beck on 12/2/22.
//

import SwiftUI
import Firebase
import AuthenticationServices
import GoogleSignIn
 
struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack{
            Spacer()
            
            VStack{
                Image("Spar")
                    .scaledToFit()
                    .frame(width: 400).padding(30).aspectRatio( contentMode: .fit)
                
                Image("logo").resizable()
                    .scaledToFit()
                    .frame(width: 400).padding(10).aspectRatio( contentMode: .fit)
                
                Image("Title").resizable()
                    .scaledToFit()
                    .frame(width: 200).padding(10).aspectRatio( contentMode: .fit)
                
                
            }
            Spacer()
            
            HStack {
                SignInWithAppleButton(.signIn,
                                      onRequest: { (request) in
                    //Set up request
                },
                                      onCompletion: { (result) in
                    switch result {
                    case .success(let authorization):
                        //Handle autorization
                        break
                    case .failure(let error):
                        //Handle error
                        break
                    }
                })
                .frame(width: 370, height: 45)
                .cornerRadius(32)
                .signInWithAppleButtonStyle(.black)
            }
            
            
            
            Button{
                authViewModel.signInWithGoogle(controller: getRootViewController())
            } label: {
                HStack{
                    Image("icons8-google-48")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("**Sign In with Google**")
                        .foregroundColor(.black)
                        .font(.system(size: 18.75))
                }
                .padding(.top, 10)
                .padding(.leading, 85)
                .padding(.trailing, 85)
                .padding(.bottom, 10)
                
                
            }.background(.white).cornerRadius(22)
            
            Button{
                
                
                
                //authViewModel.signInWithGoogle(controller: getRootViewController())
            } label: {
                HStack{
                    Image(systemName: "phone.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.green)
                    Text("**Use phone number**")
                        .foregroundColor(Color.black)
                        .font(.system(size: 18.75))
                    
                }
                .padding(.top, 10)
                .padding(.leading, 85)
                .padding(.trailing, 85)
                .padding(.bottom, 10)
                
                
            }.background(.white).cornerRadius(22)
            Spacer()
        }
        .frame(maxWidth: .infinity)

    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension View{
    func getRootViewController() -> UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        
        return root
    }
    
}

