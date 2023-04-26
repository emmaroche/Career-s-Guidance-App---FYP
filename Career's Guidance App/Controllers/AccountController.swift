//
//  AccountController.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 16/04/2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import UIKit

struct AccountController: View {
    
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
                
                VStack(alignment: .leading , spacing: 20) {
                    
                    HStack {
                        
                        Image(systemName: "person.fill")
                        // As the image is an SF Pro symbol is requires to adjust font to make it bigger over width and height frame
                            .font(.system(size: 24))
                            .frame(alignment: .leading)
                            .foregroundColor(CustomColour.customBlueColour2)
                        
                        Text(username)
                            .font(.system(size: 17, weight: .regular, design: .default))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                    }
                    
                    Text("⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯")
                        .font(.system(size: 17, weight: .regular, design: .default))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    HStack {
                        
                        Image(systemName: "envelope.fill")
                            .font(.system(size: 20))
                            .frame(alignment: .leading)
                            .foregroundColor(CustomColour.customBlueColour2)
                        
                        
                        Text(Auth.auth().currentUser?.email ?? "")
                            .font(.system(size: 17, weight: .regular, design: .default))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                    }
                    
                    Text("⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯")
                        .font(.system(size: 17, weight: .regular, design: .default))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    HStack {
                        
                        Button(action: {
                            isChangePasswordPresented.toggle()
                        }) {
                            Image(systemName: "lock.fill")
                                .font(.system(size: 24))
                                .frame(alignment: .leading)
                                .foregroundColor(CustomColour.customBlueColour2)
                            
                            Text("Change Password")
                                .font(.system(size: 17, weight: .regular, design: .default))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Image(systemName: "pencil.line")
                                .font(.system(size: 24))
                                .frame(alignment: .leading)
                                .foregroundColor(CustomColour.customBlueColour2)
                        }
                        .sheet(isPresented: $isChangePasswordPresented, content: {
                            ChangePasswordView().background(Color(UIColor(red: 0.20, green: 0.48, blue: 0.67, alpha: 1.00)))
                        })
                    }
                }.padding(.horizontal, 30)
                    .padding(.vertical, 20)
                
                Spacer()
            }   .padding(.vertical, 30)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.white)
                .modifier(CardModifier())
                .padding(.horizontal, 30)
            
            HStack{
                
                // Code resource I used to help with how to log out the user from firebase (modified to fit CGA app) https://stackoverflow.com/questions/40402413/signing-out-of-firebase-in-swift
                Button("Log Out") {
                    do {
                        try Auth.auth().signOut()
                        
                        // Code resource to help with accessing the scene delegate to check for the authentication and refresh to the welcome screen once logged out (modified to fit CGA app) https://stackoverflow.com/questions/61789369/how-to-access-scenedelegate-from-nsobject
                        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                            sceneDelegate.checkAuthentication()
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
            
        }.padding(.bottom, 100)
            .onAppear {
                fetchUserData()
            }
        
    }
    
    private func fetchUserData() {
        guard let userUID = Auth.auth().currentUser?.uid else {
            return
        }
        let userRef = Firestore.firestore().collection("users").document(userUID)
        userRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let userData = document.data()!
                let user = User(username: userData["username"] as! String, email: userData["email"] as! String, userUID: userUID)
                self.username = user.username.capitalized
            } else {
                print("Document does not exist")
            }
        }
    }
}

struct AccountController_Previews: PreviewProvider {
    static var previews: some View {
        AccountController()
    }
}
