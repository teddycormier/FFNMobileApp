//
//  LogInView.swift
//  FemaleFanNation
//
//  Created by teddy cormier on 1/17/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @Binding var currentShowingView: String
    @AppStorage("uid") var userID: String = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var LVbgrColor: Color = Color(.init(
        red: 202 / 255,
        green: 218 / 255,
        blue: 222 / 255,
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
                LVbgrColor
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("WELCOME")
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
                        Spacer()
                        
                        
                        if(email.count != 0) {
                            
                            Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(email.isValidEmail() ? .green : .red)
                        }
                        
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.black)
                    )
                    
                    .padding()
                    
                    
                    HStack {
                        Image(systemName: "lock")
                        SecureField("Password", text: $password)
                        
                        Spacer()
                        
                        if(password.count != 0) {
                            
                            Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(isValidPassword(password) ? .green : .red)
                        }
                        
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.black)
                        
                    )
                    .padding()
                    
                    Button {
                        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                            if let error = error {
                                print(error)
                                return
                            }
                            
                            if let authResult = authResult {
                                print(authResult.user.uid)
                                withAnimation {
                                    userID = authResult.user.uid
                                }
                            }
                            
                            
                        }
                    } label: {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .font(Font.custom("AvenirNext-Regular", size: 22))
                            .bold()
                        
                            .frame(maxWidth: .infinity)
                            .padding()
                        
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                            )
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.currentShowingView = "signup"
                        }
                        
                        
                    }) {
                        Text("Don't have an account?")
                            .foregroundColor(.black.opacity(0.7))
                            .font(Font.custom("AvenirNext-Regular", size: 18))
                    }
                    .padding(.all)
                    
                    Button(action: {
                        withAnimation {
                            self.currentShowingView = "resetpass"
                        }
                        
                        
                    }) {
                        Text("Forgot your password?")
                            .foregroundColor(.black.opacity(0.7))
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
