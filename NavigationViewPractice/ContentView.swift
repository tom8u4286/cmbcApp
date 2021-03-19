//
//  ContentView.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/17.
//

import SwiftUI

struct testView: View{
    var body: some View{
        Text("this is a test view!")
    }
}


struct ContentView: View {
    //1.注意State要寫在struct裡面
    //2.如果我們有很多子頁面要呈現，不要用一對isShowing2 isShowing3...，
    //用不同的建構子就好
    //或是如下設計成String，並在NavigationLink中設定tag，用selection觀察此State($變數)
    //@State private var selection: String? = nil
    @State private var selection: String? = nil

    var body: some View {
        NavigationView{
            //ScrollView並沒有真正layout他的內容，所以裡面的subview和subview之間，
            //可能會有莫名的Spacing出現
            //因此我們用VStack來layout這些subview
            ScrollView{
                VStack(spacing: 0){
                    NavigationLink( destination: sermonView(),tag:"sermon", selection:$selection){EmptyView()}
                    NavigationLink( destination: newsView(),tag:"news", selection:$selection){EmptyView()}
                    NavigationLink( destination: prayerView(), tag:"prayer", selection:$selection){EmptyView()}
                    NavigationLink( destination: Text("服事"), tag:"service", selection:$selection){EmptyView()}
                    NavigationLink( destination: CovidView(), tag:"covid", selection:$selection){EmptyView()}
                    
                    //MARK: -信息
                    Button(action:{
                        //注意：大寫的Self跟小寫的self不一樣
                        self.selection = "sermon"
                    }){
                        ZStack{
                            Image("sermon")
                                .resizable()
                                .scaledToFill()
                                .frame(height:180)
                            Text("信息")
                                .font(.largeTitle)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 180)
                    .background(Color.blue)
                    .clipped()
                    
                    
                    //MARK: -週報
                    Button(action:{
                        //注意：大寫的Self跟小寫的self不一樣
                        self.selection = "news"
                    }){
                        ZStack{
                            Image("news")
                                .resizable()
                                .scaledToFill()
                                .frame(height:180)
                            Text("週報")
                                .font(.largeTitle)
                        }
                        
                    }
                    .border(Color.red)
                    .frame(maxWidth: .infinity, maxHeight: 180)
                    .background(Color.blue)
                    .clipped()
                                        
                    
                    //MARK: -禱告會
                    Button(action:{
                        self.selection = "prayer"
                    }){
                        ZStack{
                            Image("prayer")
                                .resizable()
                                .scaledToFill()
                                .offset(x: 0, y: 40)
                                .frame(height:180)
                            Text("禱告會")
                                .font(.largeTitle)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 180)
                    .clipped()
                    
                    //MARK: -服事
                    Button(action:{
                        self.selection = "service"
                    }){
                        ZStack{
                            Image("service")
                                .resizable()
                                .scaledToFill()
                                .frame(height:180)
                            Text("服事表")
                                .font(.largeTitle)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 180)
                    .clipped()
                    
                    
                    //MARK: -防疫
                    Button(action:{
                        //注意：大寫的Self跟小寫的self不一樣
                        self.selection = "covid"
                    }){
                        ZStack{
                            Image("mask")
                                .resizable()
                                .scaledToFill()
                                .frame(height:180)
                            Text("防疫")
                                .font(.largeTitle)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 180)
                    .clipped()
                    
                }
                //1.在NavigationView中，Button中的Text都會變成藍色的，
                //因此將buttonStyle改成PlainButtonStyle
                //2.後來發現不能用，因為button的位置會跑掉
                //.buttonStyle(PlainButtonStyle())
                
                //navigationBarTitle一定要放在NavigationView之中，成為其中一個SubView的屬性
                //不可以放在之外，任何一個子View都可以
                .navigationBarTitle("景美浸信會")
                    
                }
        }
    }
}

struct item: Identifiable{
    var id: Int
    var title: String
    var imageTitle: String
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
