//
//  CovidView.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/19.
//

import SwiftUI

struct CovidView: View{
    var body: some View{
        
        GeometryReader{geo in
            VStack(alignment: .leading, spacing: 10){
                Text("COVID-19防疫措施")
                    .font(.title)
                Text("2021.3")
                    .font(.title3)
                Text("景浸防疫小組修訂")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Divider()
                Text("請弟兄姊妹持續落實「防疫新生活運動」，來到教會應主動接受量體溫、手部清潔、登記姓名(實聯制)、聚會配戴口罩。")
                Text("")
                Text("【徵召防疫天使】長期防疫工作需要您的參與支持，邀請弟兄姊妹加入「防疫天使」服事行列，協助主日防疫站量體溫服事，請於服務台報名登記加入「防疫天使」行列！")

            }.frame(alignment: .leading)
            .padding()
        }
        .navigationTitle("防疫")
    }
}
