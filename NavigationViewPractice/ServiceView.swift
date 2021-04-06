//
//  ServiceView.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/31.
//

import SwiftUI

struct ServiceView: View{
    
    @State var httpResults = [Service]()
    
    var nextWeek = ["下週", "本週"]
    
    var body: some View{
        ScrollView{
            ForEach(httpResults.indices, id: \.self){ index in
                let service = httpResults[index]
                VStack(alignment: .leading){
                    Text("\(service.date) \(nextWeek[index])")
                    .font(.title)
                    .frame(minWidth: 0,maxWidth: .infinity)
                        
                    Group{
                        Text("輪值執事:").font(.headline)
                        Text("\(service.輪值執事)").padding(.bottom)
                        Text("崇拜主席:").font(.headline)
                        Text("\(service.崇拜主席)").padding(.bottom)
                        Text("會前練唱:").font(.headline)
                        Text("\(service.會前練唱)").padding(.bottom)
                        Text("崇拜司琴:").font(.headline)
                        Text("\(service.崇拜司琴)").padding(.bottom)
                        Text("詩班指揮:").font(.headline)
                        Text("\(service.詩班指揮)").padding(.bottom)
                    }
                    Group{
                        Text("詩班司琴:").font(.headline)
                        Text("\(service.詩班司琴)").padding(.bottom)
                        Text("點收奉獻:").font(.headline)
                        Text("\(service.點收奉獻)").padding(.bottom)
                        Text("招待:").font(.headline)
                        Text("\(service.招待)").padding(.bottom)
                        Text("音控投影:").font(.headline)
                        Text("\(service.音控投影)").padding(.bottom)
                        Text("防疫天使:").font(.headline)
                        Text("\(service.防疫天使)").padding(.bottom)
                    }
                    Group{
                        Text("插花:").font(.headline)
                        Text("\(service.插花)").padding(.bottom)
                        Text("週間禱告會:").font(.headline)
                        Text("\(service.週間禱告會)").padding(.bottom)
                    }
                    Divider()
                }
                //.frame(minWidth: 0,maxWidth: .infinity,alignment: .topLeading)
                
            }
        }.padding()
        .navigationTitle("服事輪值")
        .onAppear(perform: loadData)
    }
    
    func loadData(){
        guard let url = URL(string: "https://cmbc.herokuapp.com/jsonResponse/services/") else{
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data {
                
                if let decodedResponse = try? JSONDecoder().decode(ServiceResponse.self, from: data){
                    DispatchQueue.main.async{
                        //self.results = decodedResponse.results
                        self.httpResults = decodedResponse.results
                        
                    }
                    
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}


struct ServiceResponse: Decodable{
    var results: [Service]
}

struct Service: Identifiable, Decodable{
    var id: Int
    var date: String
    var 輪值執事: String
    var 崇拜主席: String
    var 會前練唱: String
    var 崇拜司琴: String
    var 詩班指揮: String
    var 詩班司琴: String
    var 點收奉獻: String
    var 招待: String
    var 音控投影: String
    var 防疫天使: String
    var 插花: String
    var 週間禱告會: String
}
