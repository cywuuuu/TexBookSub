//
//  OnBoarding.swift
//
//  Created by cyw on 7/11/22.
//

import SwiftUI
import UIKit

struct OnBoarding: View {
    @StateObject var vm = ViewModel.vm
    @State var showSheetView = false
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor =  .systemBlue
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    var body: some View {
        NavigationView {
            pages()
        }.sheet(isPresented: $showSheetView) {
            Login().navigationBarBackButtonHidden(true).navigationBarHidden(true)
        }.animation(.none)
    }
    
}



struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}


struct pages: View {
    var body: some View {
        VStack {
            
            TabView {
                ForEach(BoardingData) { page in
                    GeometryReader { g in
                        VStack {
                            VStack (alignment: .leading){
                                Text(page.title)
                                    .font(.title).bold()
                                    .padding(.bottom, 5)
                                
                                
                                Text(page.descrip)
                                    .font(.headline)
                                    .multilineTextAlignment(.leading)
                                
                            }.padding()
                            
                            Image(page.image)
                                .resizable()
                                .scaledToFit().background(Color.blue.opacity(0.1)).cornerRadius(30)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                                ).shadow(radius: 15, x:10, y:20)
                                .padding(.top, 30)
                                .padding([.top, .horizontal], 25)
                            
                                .shadow(radius: 5, x:3, y:5)
                            
                            
                            
                            
                        }
                        
                    }
                }
            }
            
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            NavigationLink(
                destination: Login().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                label: {
                    Text("开始使用")
                        .font(.title3)
                        .padding(15)
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(40)
                })
            Spacer()
            
        }
        
        .navigationBarItems(trailing:
                                NavigationLink(
                                    destination: Login().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                                    label: {
                                        
                                        Image(systemName: "chevron.right.2")
                                            .font(Font.system(.title2))
                                        
                                    })
        )
        .navigationBarBackButtonHidden(true)
    }
}
