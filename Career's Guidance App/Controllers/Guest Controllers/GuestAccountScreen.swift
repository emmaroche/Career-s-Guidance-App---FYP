//
//  GuestAccountScreen.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 21/04/2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import UIKit

struct GuestAccountScreen: View {
    
    
    @State private var isChangePasswordPresented = false
    @State private var username: String = ""
    
    var body: some View {
        
        VStack{
            ZStack{
                Image("accountImage")
                    .resizable()
                    .ignoresSafeArea()
                    .position(x: UIScreen.main.bounds.width/2, y: 50)
                
                Text("Account Settings")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, -80)
                
                Image("logo")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(width: 200, height: 170)
                    .padding(.top, 100)
            }
            VStack(alignment: .center) {
                
                VStack(alignment: .center , spacing: 20) {
                                        
                    Text("Log in or create an account")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    HStack{
                        
                        // Code resource I used to help with how to log out the user from firebase (modified to fit CGA app) https://stackoverflow.com/questions/40402413/signing-out-of-firebase-in-swift
                        Button("Log in") {
                            do {
                                try Auth.auth().signOut()
                                
                                // Code resource to help with accessing the scene delegate to check for the authentication and refresh to the welcome screen once logged out (modified to fit CGA app) https://stackoverflow.com/questions/61789369/how-to-access-scenedelegate-from-nsobject
                                if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                                    sceneDelegate.checkAuthenticationGuestLogin()
                                    
                                }
                            } catch let error {
                                print("Error signing out: \(error.localizedDescription)")
                            }
                        }.frame(width: 300)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(CustomColour.customBlueColour)
                            .padding(15)
                            .background(CustomColour.customGreenColour)
                            .cornerRadius(12)
                        
                    }.padding(.vertical, 30)
                    
                    Text("⎯⎯⎯⎯⎯⎯⎯  or  ⎯⎯⎯⎯⎯⎯⎯")
                        .font(.system(size: 17, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    HStack{
                        
                        // Code resource I used to help with how to log out the user from firebase (modified to fit CGA app) https://stackoverflow.com/questions/40402413/signing-out-of-firebase-in-swift
                        Button("Sign up") {
                            do {
                                try Auth.auth().signOut()
                                
                                // Code resource to help with accessing the scene delegate to check for the authentication and refresh to the welcome screen once logged out (modified to fit CGA app) https://stackoverflow.com/questions/61789369/how-to-access-scenedelegate-from-nsobject
                                if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                                    sceneDelegate.checkAuthenticationGuestSignup()
                                }
                            } catch let error {
                                print("Error signing out: \(error.localizedDescription)")
                            }
                        }.frame(width: 300)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(CustomColour.customBlueColour)
                            .padding(15)
                            .background(CustomColour.customGreenColour)
                            .cornerRadius(12)
                        
                    }.padding(.top, 30)
                    
                }.padding(.horizontal, 30)
                    .padding(.vertical, 20)
                
                Spacer()
            }   .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.white)

                .padding(.horizontal, 30)
            
        }.padding(.bottom, 100)
        
        
    }
}

struct GuestAccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        GuestAccountScreen()
    }
}
