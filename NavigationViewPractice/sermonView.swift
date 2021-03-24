//
//  sermonView.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/18.
//

import SwiftUI


struct sermonView: View{
    
    var sermonData: [sermon] = [
        sermon(id: 1, date: "2020.5.17", title: "聰明的管家", pastor:"錢黛芙牧師", url: "https://www.youtube.com/embed/VpHW8CYGL3k"),
        sermon(id: 2, date: "2020.5.10", title: "珍惜自己的家", pastor:"薛銘光牧師", url: "https://www.youtube.com/embed/8Oi08ewT9T0"),
        sermon(id: 3, date: "2020.5.3", title: "上架你的福音信息", pastor:"黃主用牧師", url: "https://www.youtube.com/embed/Xv7fFP4zSJw"),
        sermon(id: 4, date: "2020.4.26", title: "那擺在前頭的路程", pastor:"錢黛芙牧師", url: "https://www.youtube.com/embed/qSpQusfQhCw"),
        sermon(id: 5, date: "2020.4.19", title: "要剛強壯膽", pastor:"劉光啟牧師", url: "https://www.youtube.com/embed/gKumJmIGoSY"),
        sermon(id: 6, date: "2020.4.12", title: "超乎想像的勝利", pastor:"黃主用牧師", url: "https://www.youtube.com/embed/IfibZyZLjhc"),
        sermon(id: 7, date: "2020.4.5", title: "我父必尊重他", pastor:"錢黛芙牧師", url: "https://www.youtube.com/embed/-Beh3QrSQ2E")
    ]
    
    
    var body: some View{
        List(sermonData){data in
            NavigationLink( destination: oneSermon(date: data.date, title: data.title, pastor: data.pastor, url: data.url)){
                Image(data.pastor)
                    .resizable()
                    .frame(width:45, height:45)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 2){
                    Text(data.title)
                        .font(.headline)
                    Text(data.pastor)
                        .font(.caption)
                    Text(data.date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }.padding(3)
            }
        }
        .navigationTitle("信息")
    }
}

struct sermon: Identifiable{
    var id: Int
    var date: String
    var title: String
    var pastor: String
    var url: String
}

struct oneSermon: View{
    
    var date: String
    var title: String
    var pastor: String
    var url: String
    
    var body: some View{
        ScrollView{
            VStack( spacing: 10){
                SwiftUIWebView(url: URL(string: url))
                    //.frame(width: geo.size.width, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                
                VStack(alignment: .leading, spacing:5){
                    Text("\(title)")
                        .font(.title)
                    Text("\(pastor)")
                        .font(.title2)
                    Text("\(date)")
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                }.frame(alignment: .leading)
                .padding(.horizontal)
                
                //.frame(width: geo.size.width, alignment: .leading)
                
                
            }
        }.navigationBarTitle("", displayMode: .inline)
    }
}

