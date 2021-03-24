//
//  TestGoogleMapView.swift
//  NavigationViewPractice
//
//  Created by 曲奕帆 on 2021/3/23.
//

import SwiftUI
import GoogleMaps

struct TestGoogleMapView: View{
    
    var body: some View{
        
        VStack{
            CMBCGMView()
                .frame(height: 300)
        }
    }
}


