//
//  AboutView.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/22.
//

import SwiftUI
import UIKit
import GoogleMaps


struct AboutView: View{
    var body: some View{
        
        GeometryReader{geo in
            ScrollView{
                CMBCGMView()
                    .frame(height: 250)
                VStack{
                    VStack{
                        Text("中華基督教景美浸信會")
                            .font(.title2)
                        Text("Ching-Mei Baptist Church")
                            .font(.subheadline)
                        Spacer()
                        Text("台北市文山區育英街63號")
                            .font(.title3)
                        Text("02-2931-4144")
                            .font(.title3)
                    }.padding(.horizontal)
                    .frame(width: geo.size.width ,alignment: .center)
                    
                    HStack(alignment: .center){
                        Image("icon_fb")
                            .resizable()
                            .scaledToFit()
                        Image("icon_youtube")
                            .resizable()
                            .scaledToFit()
                        Image("icon_ig")
                            .resizable()
                            .scaledToFit()
                    }
                    .padding(.horizontal)
                    .frame(width: geo.size.width, height: 80 ,alignment: .center)
                }
            }
        }
        .frame( alignment: .center)
        .navigationTitle("關於景浸")
    }
}


struct CMBCGMView: UIViewRepresentable{
    func makeUIView(context: Context) -> GMSMapView{
        
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 300))
        
        let camera = GMSCameraPosition.camera(withLatitude: 24.992145717981423, longitude: 121.53887059658652, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: rect, camera: camera)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 24.992145717981423, longitude: 121.53887059658652)
        marker.title = "景美浸信會"
        marker.map = mapView
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}


struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
