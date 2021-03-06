//
//  TabView.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/22.
//

import SwiftUI

struct BaseTabView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {

        TabView{
            HomeView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("home")
                }
            Text("Mail")
                .tabItem{
                    Image(systemName: "envelope.fill")
                    Text("Mail")
                }
            Text("Me")
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Me")
                }
        }
    }
}
