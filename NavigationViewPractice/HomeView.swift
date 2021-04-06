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


struct HomeView: View {
    //1.注意State要寫在struct裡面
    //2.如果我們有很多子頁面要呈現，不要用一對isShowing2 isShowing3...，
    //用不同的建構子就好
    //或是如下設計成String，並在NavigationLink中設定tag，用selection觀察此State($變數)
    //@State private var selection: String? = nil
    @State private var selection: String? = nil
    
    private var cardHeight: CGFloat = 150
    
    var body: some View {
        GeometryReader{ fullView in
            NavigationView{
                //ScrollView並沒有真正layout他的內容，所以裡面的subview和subview之間，
                //可能會有莫名的Spacing出現
                //因此我們用VStack來layout這些subview
                ScrollView{
                    VStack( alignment: .center, spacing: 0){
                        Group{
                            NavigationLink( destination: sermonView(),tag:"sermon", selection:$selection){EmptyView()}
                            NavigationLink( destination: newsView(),tag:"news", selection:$selection){EmptyView()}
                            NavigationLink( destination: prayerView(), tag:"prayer", selection:$selection){EmptyView()}
                            NavigationLink( destination: CommunityView(), tag:"community", selection:$selection){EmptyView()}
                            NavigationLink( destination: LettersView(), tag:"letters", selection:$selection){EmptyView()}
                            NavigationLink( destination: ServiceView(), tag:"service", selection:$selection){EmptyView()}
                            NavigationLink( destination: CovidView(), tag:"covid", selection:$selection){EmptyView()}
                            NavigationLink( destination: AboutView(), tag:"about", selection:$selection){EmptyView()}
                        }
                        
                        //MARK: -信息
                        Button(action:{
                            //注意：大寫的Self跟小寫的self不一樣
                            self.selection = "sermon"
                        }){
                            ZStack{
                                Image("sermon.001")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height:cardHeight)
                                Text("信息")
                                    .font(.largeTitle)
                            }
                        }
                        .frame(maxWidth: fullView.size.width, maxHeight: cardHeight )
                        .clipped()
                        
                        
                        //MARK: -消息代禱
                        
                        Button(action:{
                            //注意：大寫的Self跟小寫的self不一樣
                            self.selection = "news"
                        }){
                            ZStack{
                                Image("news.001")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height:cardHeight)
                                Text("消息.代禱")
                                    .font(.largeTitle)
                            }
                            
                        }
                        .frame(maxWidth: fullView.size.width, maxHeight: cardHeight)
                        .clipped()
                        
                        //MARK: -禱告會、社區活動
                        GeometryReader{ geo in
                            HStack(spacing: 0){
                                //禱告會
                                Button(action:{
                                    self.selection = "prayer"
                                }){
                                    ZStack{
                                        Image("pray.001")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: geo.size.width/2, height:cardHeight)
                                        Text("禱告會")
                                            .font(.largeTitle)
                                    }
                                    
                                }
                                //.frame(width: geo.size.width/2, height: cardHeight)
                                .clipped()
                                
                                
                                //社區活動
                                Button(action:{
                                    self.selection = "community"
                                }){
                                    ZStack{
                                        Image("community.001")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: geo.size.width/2, height: cardHeight)
                                        Text("週間聚會")
                                            .font(.largeTitle)
                                    }
                                }
                                //.frame(width: geo.size.width/2, height: cardHeight)
                                .clipped()
                                //.border(Color.red)
                            }
                        }
                        .frame(width: fullView.size.width, height: cardHeight)
                        //geometryReader會讓點選的時候圖片變藍，所以加入foregroundColor(.white)
                        .foregroundColor(.white)
                        
                        //MARK: -家書
                        Button(action:{
                            self.selection = "letters"
                        }){
                            ZStack{
                                Image("letters.001")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height:cardHeight)
                                Text("景浸家書")
                                    .font(.largeTitle)
                            }
                        }
                        .frame(maxWidth: fullView.size.width, maxHeight: cardHeight )
                        .clipped()
                        
                        
                        //MARK: -服事
                        Button(action:{
                            self.selection = "service"
                        }){
                            ZStack{
                                Image("serve.001")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height:cardHeight)
                                Text("服事表")
                                    .font(.largeTitle)
                            }
                        }
                        .frame(maxWidth: fullView.size.width, maxHeight: cardHeight )
                        .clipped()
                        
                        //MARK: -防疫
                        Button(action:{
                            //注意：大寫的Self跟小寫的self不一樣
                            self.selection = "covid"
                        }){
                            ZStack{
                                Image("covid.001")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height:cardHeight)
                                Text("防疫")
                                    .font(.largeTitle)
                            }
                            
                        }
                        .frame(maxWidth: fullView.size.width, maxHeight: cardHeight )
                        .clipped()
                        
                        //MARK: -關於
                        Button(action:{
                            //注意：大寫的Self跟小寫的self不一樣
                            self.selection = "about"
                        }){
                            ZStack{
                                Image("cmbc.001")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height:cardHeight)
                                Text("關於")
                                    .font(.largeTitle)
                            }
                            
                        }
                        .frame(maxWidth: fullView.size.width, maxHeight: cardHeight )
                        .clipped()
                        
                    }//VStack
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(alignment: .center)
                    
                }//ScrollView
                
                //1.在NavigationView中，Button中的Text都會變成藍色的，
                //因此將buttonStyle改成PlainButtonStyle
                //2.後來發現不能用，因為button的位置會跑掉
                //.buttonStyle(PlainButtonStyle())
                
                //navigationBarTitle一定要放在NavigationView之中，成為其中一個SubView的屬性
                //不可以放在之外，任何一個子View都可以
                .navigationBarTitle("景美浸信會")
            }//NavigationView
        }//GeometryReader(fullView)
    }//Body
}//ContentView

struct item: Identifiable{
    var id: Int
    var title: String
    var imageTitle: String
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
