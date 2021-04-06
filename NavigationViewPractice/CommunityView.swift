//
//  CommunityView.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/30.
//

import SwiftUI

struct CommunityView: View{
    
    @State var httpResults = Community(id: 0, community: "", church: "", school: "", fellowship: "")
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                
                Group{
                    Text("團契/小家聚會")
                        .font(.title2)
                    Text(httpResults.fellowship)
                }
                
                Divider()
                Group{
                    
                    Text("主日學")
                        .font(.title2)
                    Text(httpResults.school)
                }
                
                Divider()
                Group{
                    Text("教會聚會")
                        .font(.title2)
                    Text(httpResults.church)
                }
                
                Divider()
                Group{
                    Text("社區活動")
                        .font(.title2)
                    Text(httpResults.community)
                }
                
            }
            .padding()
        }
        .navigationTitle("週間聚會")
        .onAppear(perform: loadData)
    }
    
    func loadData(){
        guard let url = URL(string: "https://cmbc.herokuapp.com/jsonResponse/community/") else{
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data {
                
                if let decodedResponse = try? JSONDecoder().decode(Community.self, from: data){
                    DispatchQueue.main.async{
                        //self.results = decodedResponse.results
                        self.httpResults = decodedResponse
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct Community: Decodable{
    var id: Int
    var community: String
    var church: String
    var school: String
    var fellowship: String
}
