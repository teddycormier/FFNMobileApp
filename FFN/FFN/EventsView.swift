//
//  EventsView.swift
//  FemaleFanNation
//
//  Created by teddy cormier on 1/5/23.
//

import SwiftUI

struct EventsView: View {
    @State private var selectedTab: Tab = .megaphone
    
    @AppStorage(UserSettings.usernameKey) var username = ""
    @AppStorage(UserSettings.membershipKey) var isMembership = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView {
            Form {
            }
            .navigationTitle("Events")
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

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
