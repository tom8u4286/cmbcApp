//
//  newsView.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/18.
//

import SwiftUI

struct newsView: View{
    var testData: [singleNews] = [
        singleNews(id: 1, date: "2020.3.1", title: "title1"),
        singleNews(id: 2, date: "2020.3.2", title: "title2"),
        singleNews(id: 3, date: "2020.3.3", title: "title3"),
        singleNews(id: 4, date: "2020.3.4", title: "title4"),
        singleNews(id: 5, date: "2020.3.5", title: "title5"),
        singleNews(id: 6, date: "2020.3.6", title: "title6"),
        singleNews(id: 7, date: "2020.3.7", title: "title7")
    ]
    
    @State private var selection: String? = nil
    
    var body: some View{
        List(testData){data in
            NavigationLink( destination: Text(String(data.date))){
                Image(systemName: "photo")
                VStack(alignment: .leading){
                    Text(data.title)
                        .font(.headline)
                    Text(data.date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }.padding(3)
            }
        }
        .navigationTitle("週報")
    }
}

struct singleNews: Identifiable{
    var id: Int
    var date: String
    var title: String
}

struct newsView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        newsView()
    }
}
