//
//  SettingsView.swift
//  BirdMusic
//
//  Created by Gunnar Beck on 12/2/22.
//

import SwiftUI
import Firebase
import AuthenticationServices

struct SettingsView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
            List{
                HStack{
                    Text("Tier 1")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    Circle()
                        .fill(Color.green)
                            .frame(width: 15, height: 15)
                }
            
                padding()

                HStack {
                     Text("Tier 2")
                       .font(.system(size: 15))
                       .foregroundColor(.gray)
                    Circle()
                       .fill(Color.red)
                       .frame(width: 15, height: 15)
                }
            
                NavigationLink (destination: Text("Destination"),
                                label: {Text("ID")}
                )
                
                NavigationLink (destination: Text("Destination"),
                                label: {Text("Phone number")}
                )
                
                NavigationLink (destination: Text("Destination"),
                                label: {Text("Bank account verification ")}
                )
            }
            .navigationBarTitle("Account Setting", displayMode: .inline)
        }
    }

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
