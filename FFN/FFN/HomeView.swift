//
//  ContentView.swift
//  FemaleFanNation
//
//  Created by teddy cormier on 1/3/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedTab: Tab = .house
    @State private var isEventsView = false
    @State private var isHomeView = true
    
    @AppStorage(UserSettings.usernameKey) var username = ""
    @AppStorage(UserSettings.membershipKey) var isMembership = false
    
    @Environment(\.openURL) var openURL
    @Environment(\.colorScheme) var colorScheme
    
    init() {
        UITabBar.appearance().isHidden = true
        
        for family in UIFont.familyNames {
             print(family)

             for names in UIFont.fontNames(forFamilyName: family){
             print("== \(names)")
             }
        }
    }
    
    var accentColor: Color = Color(.init(
        red: 34 / 255,
        green: 48 / 255,
        blue: 75 / 255,
        alpha: 1))
    
    var usernameDark: Color = Color(.init(
        red: 148 / 255,
        green: 26 / 255,
        blue: 40 / 255,
        alpha: 1))
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    if (selectedTab == .house) {
                        NavigationView {
                            ScrollView {
                                Spacer()
                                VStack{
                                    VStack{
                                        Section() {
                                            Text("**WHO WE ARE**")
                                                .font(Font.custom("AvenirNext-Bold", size: 21))
                                                
                                            
                                            Text("**We are your #1 Female Fan Community** \nA new era of female sports fans, we love our teams. We bring fun wherever we go and share a desire to make a difference for the causes we care most about.")
                                                .padding(.bottom, 45)
                                                .font(Font.custom("AvenirNext-Regular", size: 18))
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.all)
                                        //                                    .background (
                                        //                                        Rectangle()
                                        //                                            .fill(Color(colorScheme == .light ? .white : .systemGray6).shadow(.drop(color: (colorScheme == .light ? accentColor : .gray), radius: 3)))
                                        //                                    )
                                        Section() {
                                            Text("**WHAT WE DO**")
                                                .font(Font.custom("AvenirNext-Bold", size: 21))
                                            
                                            Text("**Bring together all you love about sports!** \nRecognizing an unstoppable community of female sports fans, we are granting you inside access to elite events, enhancing your game day experience, and making sure you are the best dressed at the stadium.")
                                                .font(Font.custom("AvenirNext-Regular", size: 18))
                                                .multilineTextAlignment(.trailing)
                                                .padding(.bottom, 45)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .padding(.all)
                                        
                                        Section() {
                                            Text("**WHY JOIN US**")
                                                .font(Font.custom("AvenirNext-Bold", size: 21))
                                            
                                            Text("**Free Perks, VIP Access and so much more!** \nAs a member of the Female Fan Nation, you'll have access to exclusive events, member only discounts, charitable opportunities, and curated team gear. ")
                                                .font(Font.custom("AvenirNext-Regular", size: 18))
                                                .padding(.bottom, 45)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.all)
                                        //                                    .background (
                                        //                                        Rectangle()
                                        //                                            .fill(Color(colorScheme == .light ? .white : .systemGray6).shadow(.drop(color: (colorScheme == .light ? accentColor : .gray), radius: 3)))
                                        //                                    )
                                        .background (
                                            Image("gillette")
                                                .padding(.bottom, 440)
                                                .opacity(0.125)
                                        )
                                    }
                                    Section() {
                                        HStack {
                                            Spacer()
                                            Link("Check out FFN's Fan of the Week!", destination: URL(string: "https://www.femalefannation.com/Fan-Of-The-Week")!)
                                                .font(Font.custom("AvenirNext-Medium", size: 20))
                                                .padding(.top, 8)
                                                .padding(.bottom, 8)
                                                .padding(.all)
                                                .background (
                                                    RoundedRectangle(cornerRadius: 18)
                                                        .fill(Color(colorScheme == .light ? .white : .systemGray6).shadow(.drop(color: (colorScheme == .light ? accentColor : .gray), radius: 3)))
                                                )
                                                .accentColor(colorScheme == .light ? .black : .white)
                                                .shadow(radius: 1)
                                            Spacer()
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, 200)
                                    
                                    Section() {
                                        HStack {
                                            Spacer()
                                            Spacer()
                                            Link("Our Partners", destination: URL(string: "https://www.femalefannation.com/Our-Partners")!)
                                                .font(Font.custom("AvenirNext-Medium", size: 20))
                                                .padding(.top, 8)
                                                .padding(.bottom, 8)
                                                .padding(.all)
                                                .background (
                                                    RoundedRectangle(cornerRadius: 18)
                                                        .fill(Color(colorScheme == .light ? .white : .systemGray6).shadow(.drop(color: (colorScheme == .light ? accentColor : .gray), radius: 3)))
                                                )
                                                .accentColor(colorScheme == .light ? .black : .white)
                                                .shadow(radius: 1)
                                            Spacer()
                                            Link("Our Mission", destination: URL(string: "https://www.femalefannation.com/Mission")!)
                                                .font(Font.custom("AvenirNext-Medium", size: 20))
                                                .padding(.top, 8)
                                                .padding(.bottom, 8)
                                                .padding(.all)
                                                .background (
                                                    RoundedRectangle(cornerRadius: 18)
                                                        .fill(Color(colorScheme == .light ? .white : .systemGray6).shadow(.drop(color: (colorScheme == .light ? accentColor : .gray), radius: 3)))
                                                )
                                                .accentColor(colorScheme == .light ? .black : .white)
                                                .shadow(radius: 1)
                                            Spacer()
                                            Spacer()
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, 30)
                                    
                                    
                                    Section() {
                                        VStack{
                                            HStack {
                                                Text("**Check us out ↓**")
                                                    .font(Font.custom("AvenirNext-Regular", size: 15))
                                                    .foregroundColor(.white)
                                                    .padding(.all)
                                            }
                                            HStack {
                                                Spacer()
                                                Spacer()
                                                Button(action: {
                                                    openURL(URL(string: "https://www.facebook.com/FemaleFanNation/")!)
                                                }, label: {
                                                    Image("facebook")
                                                        .resizable()
                                                        .frame(width: 50, height: 50)
                                                })
                                                Spacer()
                                                Button(action: {
                                                    openURL(URL(string: "https://www.instagram.com/femalefannation/")!)
                                                }, label: {
                                                    Image("instagram")
                                                        .resizable()
                                                        .frame(width: 50, height: 50)
                                                })
                                                Spacer()
                                                Button(action: {
                                                    openURL(URL(string: "https://twitter.com/femalefannation")!)
                                                }, label: {
                                                    Image("twitter")
                                                        .resizable()
                                                        .frame(width: 50, height: 50)
                                                })
                                                Spacer()
                                                Spacer()
                                            }
                                            HStack {
                                                Image("FFNFounded")
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                                    .padding(.top, 30)
                                                    .padding(.bottom, 30)
                                            }
                                            HStack {
                                                Text("**©2023 • Female Fan Nation™**")
                                                    .font(Font.custom("AvenirNext-Regular", size: 14))
                                                    .foregroundColor(.white)
                                                    .padding(.all)
                                            }
                                            HStack {
                                                Text("**Produced By ⌇ Teddy Cormier**")
                                                    .font(Font.custom("AvenirNext-Regular", size: 13))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        .background(
                                            Rectangle()
                                                .fill(accentColor .shadow(.drop(color: (colorScheme == .light ? accentColor : .gray), radius: 3)))
                                                .shadow(radius : 2)
                                                .frame(height: 435)
                                        )
                                        .padding(.top, 200)
                                    }
                                }
                                .navigationTitle("Welcome")
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
                                            .foregroundColor(Color(colorScheme == .light ? .systemGray : .red))
                                            .padding(.all)
                                    }
                                }
                            }
                        }
                    }
                    else if (selectedTab == .gearshape) {
                        SettingsView()
                    }
                    else if (selectedTab == .location) {
                        FanZoneView()
                    }
                    else if (selectedTab == .megaphone) {
                        EventsView()
                    }
                    else {
                        StoreView()
                    }
                }
            }
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
