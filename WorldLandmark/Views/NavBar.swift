//
//  navBar.swift
//
//  Created by cyw on 7/11/22.
//

import SwiftUI

struct NavBar: View {
    @State private var selection = 1
    @StateObject var vm = ViewModel.vm
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    var body: some View {
        TabView(selection: $selection) {
            HomeView().tabItem {
                VStack {
                    Image(systemName: "bookmark.square.fill")
                    Text("订阅").fontWeight(.heavy)
                }
                
            }.tag(1).navigationBarBackButtonHidden(true).navigationBarHidden(true).navigationBarTitle("")
            
            PublishView().tabItem {
                VStack {
                    Image(systemName: "book.circle.fill")
                    Text("发布").fontWeight(.heavy)
                }
                
            }.tag(2)
            
            Cart().tabItem {
                VStack {
                    Image(systemName: "cart.circle.fill")
                    Text("已购").fontWeight(.heavy)
                }
                
            }.tag(3)
        }
        
        .accentColor(Color(#colorLiteral(red: 0.580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
        .font(.headline)
        
        
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
