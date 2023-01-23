//
//  FanZoneView.swift
//  FemaleFanNation
//
//  Created by teddy cormier on 1/9/23.
//

import SwiftUI

struct FanZoneView: View {    
    @State private var selectedTab: Tab = .location
    
    @AppStorage(UserSettings.usernameKey) var username = ""
    @AppStorage(UserSettings.membershipKey) var isMembership = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView {
            Form {
            }
            .navigationTitle("Fan Zone")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    if (isMembership) {
                        Text("Premium Member")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray))
                    }
                    else {
                        Text("Basic Member")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray))
                    } 
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    TextField("", text: $username)
                        .foregroundColor(Color(.systemGray))
                        .padding(.all)
                }
            }
        }
    }
}

struct FanZoneView_Previews: PreviewProvider {
    static var previews: some View {
        FanZoneView()
    }
}

