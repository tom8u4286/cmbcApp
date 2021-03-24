//
//  newsView.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/18.
//

import SwiftUI

struct newsView: View{
    var newsData: [News] = [
        News(id: 1, date: "2021.3.21", content: "【記念耶穌為我們罪受難-會前禱告會】尚有三週（至3/31）\"每週三\"18:30-19:20在2樓大堂，有「記念耶穌為我們罪受難-會前禱告會」，讓我們齊為世界疫情、國家、教會向上帝呼求，邀請弟兄姐妹一起來參加。\n\n 【綠島福音隊】2021年上半年度綠島福音隊將於下主日(3/14)開始受理報名，名額最多7人為限，3/28（日）中午12:00或額滿截止報名，本梯次時間4/19(一)-4/23(五)，為期5天，其餘詳情請閱報名表說明。有感動的弟兄姊妹請為自己與福音隊禱告，感謝主讓景美浸信會在疫情期間還能有到離島傳福音的機會。\n\n 【2021社區韓文春季班】即將開課，課程資訊如下：\n師資：尹在成牧師(韓籍)、尹金美敬師母(韓籍) \n 時間、地點：3/25起每週四19:00-20:30在地下室副堂，共10堂課\n 費用：免費教授（課本費用由學員自行負擔）\n ※本課程程度適合初學者，歡迎弟兄姊妹邀請親友參加並至服務台報名參加 \n\n【受難復活節】相關活動如下：\n【紀念耶穌受難崇拜】4/2（五）20:00 \n【復活節彩蛋】歡迎弟兄姊妹自行煮蛋分送親友鄰居，與親友分享基督復活的福音信息，教會將提供彩蛋裝飾收縮膜，有需要者請至服務台索取使用。\n\n【愛心基金奉獻】教會常設之【愛心基金】持續關心會內會外遭逢急難經濟困難的肢體，神是樂意給予的神，甚願你我富足，使我們能成為祝福別人的器皿和管道，歡迎弟兄姊妹常使用奉獻袋註明為愛心基金奉獻。\n【4月每日活水】請預訂《每日活水》的弟兄姊妹，會後至服務台領取。（《活潑的生命》已發送完畢）"),
        News(id: 2, date: "2099.3.2", content: "【記念耶穌為我們罪受難-會前禱告會】尚有三週（至3/31）\"每週三\"18:30-19:20在2樓大堂，有「記念耶穌為我們罪受難-會前禱告會」，讓我們齊為世界疫情、國家、教會向上帝呼求，邀請弟兄姐妹一起來參加。\n\n 【綠島福音隊】2021年上半年度綠島福音隊將於下主日(3/14)開始受理報名，名額最多7人為限，3/28（日）中午12:00或額滿截止報名，本梯次時間4/19(一)-4/23(五)，為期5天，其餘詳情請閱報名表說明。有感動的弟兄姊妹請為自己與福音隊禱告，感謝主讓景美浸信會在疫情期間還能有到離島傳福音的機會。\n\n 【2021社區韓文春季班】即將開課，課程資訊如下：\n師資：尹在成牧師(韓籍)、尹金美敬師母(韓籍) \n 時間、地點：3/25起每週四19:00-20:30在地下室副堂，共10堂課\n 費用：免費教授（課本費用由學員自行負擔）\n ※本課程程度適合初學者，歡迎弟兄姊妹邀請親友參加並至服務台報名參加 \n\n【受難復活節】相關活動如下：\n【紀念耶穌受難崇拜】4/2（五）20:00 \n【復活節彩蛋】歡迎弟兄姊妹自行煮蛋分送親友鄰居，與親友分享基督復活的福音信息，教會將提供彩蛋裝飾收縮膜，有需要者請至服務台索取使用。\n\n【愛心基金奉獻】教會常設之【愛心基金】持續關心會內會外遭逢急難經濟困難的肢體，神是樂意給予的神，甚願你我富足，使我們能成為祝福別人的器皿和管道，歡迎弟兄姊妹常使用奉獻袋註明為愛心基金奉獻。\n【4月每日活水】請預訂《每日活水》的弟兄姊妹，會後至服務台領取。（《活潑的生命》已發送完畢）"),
        News(id: 3, date: "2099.3.3", content: ""),
        News(id: 4, date: "2099.3.4", content: ""),
        News(id: 5, date: "2099.3.5", content: ""),
        News(id: 6, date: "2099.3.6", content: ""),
        News(id: 7, date: "2099.3.7", content: "")
    ]
    
    @State private var selection: String? = nil
    
    var body: some View{
        List(newsData){news in
            NavigationLink( destination: SingleNewsView(news: news)){
                Image(systemName: "paperplane.fill")
                VStack(alignment: .leading){
                    Text(news.date)
                        .font(.title2)
                }
            }.padding(.vertical, 3)
        }
        .navigationTitle("消息.代禱")
    }
}

struct News: Identifiable{
    var id: Int
    var date: String
    var content: String
}

struct SingleNewsView: View{
    
    var news: News
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                Text(news.date)
                    .font(.title2)
                Text(news.content)
                    .font(.title3)
            }.frame(alignment: .leading)
            .padding()
        }.navigationBarTitle("", displayMode: .inline)
    }
}
