//
//  prayerView.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/18.
//

import SwiftUI

struct prayerView: View{
    
    var prayerList: [prayer] = [
        prayer(id: 1, date: "2020.3.1", title: "prayer1"),
        prayer(id: 2, date: "2020.3.2", title: "prayer2"),
        prayer(id: 3, date: "2020.3.3", title: "prayer3"),
        prayer(id: 4, date: "2020.3.4", title: "prayer4"),
        prayer(id: 5, date: "2020.3.5", title: "prayer5"),
        prayer(id: 6, date: "2020.3.6", title: "prayer6"),
        prayer(id: 7, date: "2020.3.7", title: "prayer7")
    ]
    
    var body: some View{
        NavigationView{
            List(prayerList){ prayer in
                Image(systemName: "photo")
                VStack{
                    Text("\(prayer.title)")
                        .font(.headline)
                    Text("\(prayer.date)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }.padding(3)
            }.navigationBarHidden(true)
        }
        .navigationTitle("禱告會")
    }
}

struct prayer: Identifiable{
    var id: Int
    var date: String
    var title: String
}
