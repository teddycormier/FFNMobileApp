//
//  SplashScreen.swift
//  FemaleFanNation
//
//  Created by teddy cormier on 1/3/23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.31
    @State private var opacity = 0.5
    
    @AppStorage("uid") var userID: String = ""
    
    var SSbgrColor: Color = Color(.init(
        red: 202 / 255,
        green: 218 / 255,
        blue: 222 / 255,
        alpha: 1))
    
    var body: some View {
        if isActive {
            if userID == "" {
                AuthView()
            }
            else {
                HomeView()
            }
        } else {
            ZStack{
                SSbgrColor
                    .ignoresSafeArea()
                VStack{
                    VStack{
                        Image("FFNLogo")
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 0.7
                            self.opacity = 1.0
                        }
                        
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation{
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

