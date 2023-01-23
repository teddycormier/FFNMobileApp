//
//  ForgotPassView.swift
//  FemaleFanNation
//
//  Created by teddy cormier on 1/18/23.
//

import SwiftUI
import FirebaseAuth

struct ResetPassView: View {
    @Binding var currentShowingView: String
    @AppStorage("uid") var userID: String = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var email: String = ""
    @State private var showingAlert = false
    
    var RPbgrColor: Color = Color(.init(
        red: 255 / 255,
        green: 255 / 255,
        blue: 255 / 255,
        alpha: 1))
    
    
    var body: some View {
        NavigationView {
            ZStack {
                RPbgrColor
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("RESET PASSWORD")
                            .foregroundColor(.black)
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
                            .foregroundColor(.black)
                        Spacer()
                        
                        
                        if(email.count != 0) {
                            
                            Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(email.isValidEmail() ? .green : .red)
                        }
                    }
                    .foregroundColor(.black)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.black)
                    )
                    .padding(.all)
                    
                    Text("*In order to reset your password, please enter the email associated with your account and hit the reset password button.*")
                        .foregroundColor(.black.opacity(0.7))
                        .font(Font.custom("AvenirNext-Regular", size: 16))
                        .padding(.all)
                    
                    Button {
                        showingAlert.toggle()
                        Auth.auth().sendPasswordReset(withEmail: email) { (error) in }
                    } label: {
                        Text("Reset Password")
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
                    .alert("A password reset email has been sent to: " + email , isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
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
                            self.currentShowingView = "login"
                        }
                    }) {
                        Text("Know your password?")
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

