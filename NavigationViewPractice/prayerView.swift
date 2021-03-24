//
//  prayerView.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/18.
//

import SwiftUI

struct prayerView: View{
    
    var prayerList: [prayer] = [
        prayer(id: 1, title: "週間崇拜禱告會", date:"2021.3.17", pastor: "錢黛芙牧師", content:
               "\n 1.為各項事工會議代禱，求神施恩，賜一切順利蒙恩。\n 3/19(五)19:30執事會會議 \n 3/21(日)12:00成主教師會議\n\n 2.為幸福小組主日（3/14）的啟動，求主聖靈同在大大施恩帶領。\n 福2分組：\n[錢牧師] / 喔耶 （週日15:00）\n[林博清] / TK Family（週日16:30）\n[毛傳道] / Go!幸福（週二14:00）\n[黃牧師] / Aloha幸福趴（週四14:00）\n[薛傳道] / Chill一下（週六15:00）\n門訓課程：求主賜每位參與的弟兄姊妹，有心力有恩典完成每次課程。\n門徒學校下：每週四晚上七點（至5/13），講師：黃牧師&毛傳道\n幸福大學上：每週六上午九點半（至5/15），講師：黃牧師&林博清\n\n3.為詩班的受難節獻詩練習繼續禱告，主賜詩班練得有果效。\n\n4.「記念耶穌為我們罪受難-會前禱告會」，一直到3/31每週三18:30-19:20，請為此禱告，求神同在施恩。\n\n5.請為本週一~三進行中的大陸網路培訓工作代禱，求主保守使用。"),
        
        prayer(id: 2, title: "週間崇拜禱告會", date:"2099.4.8", pastor: "薛心怡傳道", content: ""),
        prayer(id: 3, title: "週間崇拜禱告會", date:"2099.4.15", pastor: "黃主用牧師", content: ""),
        prayer(id: 4, title: "週間崇拜禱告會", date:"2099.4.22", pastor: "錢黛芙牧師", content: ""),
        prayer(id: 5, title: "週間崇拜禱告會", date:"2099.4.29", pastor: "薛心怡傳道", content: ""),
        prayer(id: 6, title: "週間崇拜禱告會", date:"2099.5.6", pastor: "黃主用牧師", content: ""),
        prayer(id: 7, title: "週間崇拜禱告會", date:"2099.5.13", pastor: "錢黛芙牧師", content: "")
    ]
    
    var body: some View{
        List(prayerList){ prayer in
            NavigationLink(destination: singlePrayerView(data: prayer)){
                Image(prayer.pastor)
                    .resizable()
                    .frame(width:45, height:45)
                    .clipShape(Circle())
                VStack(alignment: .leading){
                    Text("\(prayer.date) \(prayer.title)")
                        .font(.headline)
                    Text("主領: \(prayer.pastor)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }.frame(alignment: .leading)
                .padding(5)
            }
        }
        .navigationTitle("禱告會")
    }
}

struct prayer: Identifiable{
    var id: Int
    var title: String
    var date: String
    var pastor: String
    var content: String
}


struct singlePrayerView: View{
    var data: prayer
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                VStack(alignment: .leading, spacing:5){
                    Text("\(data.title)")
                        .font(.title)
                    Text("主領: \(data.pastor)")
                        .font(.title2)
                    Text("\(data.date)")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                .frame(alignment: .leading)
                .padding()
                
                Divider()
                
                Text("\(data.content)")
                    .padding(.horizontal)
            }
        }.navigationBarTitle("", displayMode: .inline)
    }
}


