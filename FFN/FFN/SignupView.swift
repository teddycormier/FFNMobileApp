//
//  SignupView.swift
//  FemaleFanNation
//
//  Created by teddy cormier on 1/17/23.
//

import SwiftUI
import FirebaseAuth

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @AppStorage("uid") var userID: String = ""
    @Binding var currentShowingView: String
    
    var SIaccentColor: Color = Color(.init(
        red: 34 / 255,
        green: 48 / 255,
        blue: 75 / 255,
        alpha: 1))
    
    private func isValidPassword(_ password: String) -> Bool {
        // minimum 6 characters long
        // 1 uppercase character
        // 1 special char
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                SIaccentColor
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("CREATE ACCOUNT")
                            .font(Font.custom("AvenirNext-Bold", size: 35))
                            .padding(.all)
                            .padding(.top, 50)
                        Spacer()
                    }
                    .padding()
                    .padding(.top)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "mail")
                        TextField("Email", text: $email)
                            .preferredColorScheme(.dark)
                            .foregroundColor(.white)
                        Spacer()
                        
                        
                        if(email.count != 0) {
                            
                            Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(email.isValidEmail() ? .green : .red)
                        }
                        
                    }
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                        
                    )
                    
                    .padding()
                    
                    
                    HStack {
                        Image(systemName: "lock")
                        SecureField("Password", text: $password)
                            .preferredColorScheme(.dark)
                            .foregroundColor(.white)

                        Spacer()
                        
                        if(password.count != 0) {
                            
                            Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(isValidPassword(password) ? .green : .red)
                        }
                        
                    }
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                        
                    )
                    .padding()
                    
                    Button {
                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                            
                            if let error = error {
                                print(error)
                                return
                            }
                            
                            if let authResult = authResult {
                                print(authResult.user.uid)
                                userID = authResult.user.uid
                                
                            }
                        }
                        
                    } label: {
                        Text("Create New Account")
                            .foregroundColor(.black)
                            .font(Font.custom("AvenirNext-Regular", size: 22))
                            .bold()
                        
                            .frame(maxWidth: .infinity)
                            .padding()
                        
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                            )
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 60)
                    
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.currentShowingView = "login"
                        }
                    }) {
                        Text("Already have an account?")
                            .foregroundColor(.white)
                            .font(Font.custom("AvenirNext-Regular", size: 18))
                    }
                    .padding(.bottom, 100)
                    
                    Spacer()
                    Spacer()
                    
                }
                .background(
                    Image("texture")
                        .ignoresSafeArea()
                        .opacity(0.15)
                )
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Image("FFNLogo")
                            .resizable()
                            .frame(width: 47, height: 65)
                            .padding(.top, 50)
                            .padding(.trailing, 5)
                            .padding(.all)
                    }
                }
            }
        }
    }
}
