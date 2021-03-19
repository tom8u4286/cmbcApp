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
                Text("景浸【防疫階段二】公告")
                    .font(.title)
                Text("2020.6.5")
                    .font(.title3)
                Text("景浸防疫小組修訂")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Divider()
                Text("由於國內疫情風險持續降低，5/26中央流行疫情指揮中心表示將自6/7鬆綁民眾生活防疫措施。景浸防疫小組決議自6/6(六)起教會回到「防疫階段二」。除了主日恢復原四堂崇拜，助道會小家也可以正常進行。請弟兄姊妹落實「防疫新生活運動」，到教會應接受體溫測量、手部清潔、登記姓名、聚會配戴口罩。")

            }.frame(alignment: .leading)
            .padding()
        }
        .navigationTitle("防疫")
    }
}
