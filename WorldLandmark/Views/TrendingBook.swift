//
//  TrendingWeek.swift
//
//  Created by cyw on 7/11/22.
//

import SwiftUI

struct TrendingBook: View {
    @State var trendingBook : BookModel
    @StateObject var vm = ViewModel.vm
    var body: some View {
        VStack {
            trendingBook.BookImage
                .resizable()
                .frame(width: 270, height: 150)
            
            HStack {
                Text(trendingBook.title)
                    .bold()
                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            
            HStack {
                Text(trendingBook.publisher)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            
            HStack {
                ForEach(0 ..< trendingBook.stars) { item in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.subheadline)
                }
                Spacer()
                
                Text(String(trendingBook.price))
                    .font(.subheadline)
                    .bold()
            }
            .padding(.bottom, 30)
            .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
        }
        .frame(width: 250, height: 250)
        .cornerRadius(10)
        
    }
    
    
}

//struct TrendingBook_Previews: PreviewProvider {
//    static var previews: some View {
//        TrendingBook(trendingBook: bookManager.publishedPool[0])
//    }
//}
