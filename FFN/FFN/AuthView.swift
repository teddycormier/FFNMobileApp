//
//  AuthView.swift
//  FemaleFanNation
//
//  Created by teddy cormier on 1/17/23.
//

import SwiftUI

struct AuthView: View {
    @State private var currentViewShowing: String = "login" 
        
    var body: some View {
        
        if(currentViewShowing == "login") {
            LoginView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.light)
        } else if (currentViewShowing == "signup"){
            SignupView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.dark)
                .transition(.move(edge: .bottom))
        } else {
            ResetPassView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.light)
                .transition(.move(edge: .bottom))
        }
        
  
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
