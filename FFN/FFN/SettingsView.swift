//
//  SettingsView.swift
//  FemaleFanNation
//
//  Created by teddy cormier on 1/5/23.
//

import SwiftUI
import iPhoneNumberField
import FirebaseAuth

struct UserSettings {
    static let firstNameKey = "firstName"
    static let lastNameKey = "lastName"
    static let phoneKey = "phone"
    static let emailKey = "email"
    static let usernameKey = "username"
    static let membershipKey = "membership"
    static let notificationsKey = "notificationsOn"
    static let newsletterKey = "newsletterOn"
    static let birthdate = "date"
}

struct SettingsView: View {
    
    @AppStorage(UserSettings.firstNameKey) var firstName = ""
    @AppStorage(UserSettings.lastNameKey) var lastName = ""
    @AppStorage(UserSettings.phoneKey) var phone = ""
    @AppStorage(UserSettings.emailKey) var email = ""
    @AppStorage(UserSettings.usernameKey) var username = ""
    @AppStorage(UserSettings.membershipKey) var isMembership = false
    @AppStorage(UserSettings.notificationsKey) var isNotifications = false
    @AppStorage(UserSettings.newsletterKey) var isNewsletter = false
    
    @State private var selectedTab: Tab = .gearshape
    @State private var showNavigationBar = false
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    
    @AppStorage("uid") var userID: String = ""
    
    
    var accentColor: Color = Color(.init(
        red: 148 / 255,
        green: 26 / 255,
        blue: 40 / 255,
        alpha: 1))
    
    var body: some View {
        NavigationView{
            ZStack{
                Form {
                    Section(header: Text("Personal Information")) {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                        iPhoneNumberField("+1 (000) 000-0000", text: $phone)
                            .flagHidden(false)
                            .prefixHidden(false)
                        Button {
                            showingAlert1 = true
                        } label: {
                            Text("Change Email")
                        }
                        .alert("Change Email", isPresented: $showingAlert1, actions: {
                            TextField("New Email", text: $email)
                            
                            Button("Change", action: {
                                showingAlert2 = true
                                let user = Auth.auth().currentUser
                                user?.updateEmail(to: "email") { error in
                                if error != nil {
                                    // An error happened
                                } else {
                                   // Email updated.
                                   }
                                }
                            })
                            Button("Cancel", role: .cancel, action: {})
                        }, message: {
                            Text("Please enter your new email")
                        })
                    }
                    
                    Section(header: Text("In App Username / Identifier")) {
                        TextField("Username", text: $username)
                        Toggle("Premium Member", isOn: $isMembership)
                            .toggleStyle(SwitchToggleStyle(tint: accentColor))
                    }
                    
                    Section(header: Text("Actions")) {
                        Toggle("Notifications", isOn: $isNotifications)
                            .toggleStyle(SwitchToggleStyle(tint: accentColor))
                        Toggle("Receive Newsletter", isOn: $isNewsletter)
                            .toggleStyle(SwitchToggleStyle(tint: accentColor))
                    }
                    
                    Section(header: Text("Additional Resources")) {
                        Link("Terms of service", destination: URL(string: "https://www.femalefannation.com/")!)
                        Link("Privacy policy", destination: URL(string: "https://www.femalefannation.com/")!)
                        Link("Contact us", destination: URL(string: "https://www.femalefannation.com/")!)
                        Button( action: {
                            let firebaseAuth = Auth.auth()
                            do {
                                try firebaseAuth.signOut()
                                withAnimation {
                                    userID = ""
                                }
                            } catch let signOutError as NSError {
                                print("Error signing out: %@", signOutError)
                            }
                        }) {
                            Text("Sign Out")
                        }
                    }
                    
                    VStack{
                        HStack{
                            Spacer()
                            Text("*CHANGES WILL SAVE AUTOMATICALLY*")
                                .font(.caption)
                                .foregroundColor(Color(.systemGray))
                            Spacer()
                        }
                        
                    }
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Settings")
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
                        Button {
                            hidekeyboard()
                        } label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                        }
                    }
                }
                .accentColor(accentColor)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

#if canImport(UIKit)
extension View {
    func hidekeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
