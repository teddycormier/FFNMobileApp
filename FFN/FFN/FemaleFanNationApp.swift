//
//  FemaleFanNationApp.swift
//  FemaleFanNation
//
//  Created by teddy cormier on 1/3/23.
//

import SwiftUI
import FirebaseCore

@main
struct FemaleFanNationApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}
