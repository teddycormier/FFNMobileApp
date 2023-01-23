//
//  CustomTabBar.swift
//  FemaleFanNation
//
//  Created by teddy cormier on 1/4/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case gearshape
    case location
    case house
    case megaphone
    case cart
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    var IconBgrColor: Color = Color(.init(
        red: 148 / 255,
        green: 26 / 255,
        blue: 40 / 255,
        alpha: 1))

    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(tab == selectedTab ? IconBgrColor : .gray)
                        .font(.system(size: 20))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(20)
            .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 2)
                    )
            .padding()
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}
