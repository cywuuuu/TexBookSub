//
//  PreviewCard.swift
//  WorldLandmark
//
//  Created by cyw on 2022/10/15.
//

import SwiftUI
struct PreviewCard: View {
    var book: BookModel
    var body: some View {
        VStack {
            book.BookImage
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                HStack {
                    VStack(alignment: .leading) {
                        Text(book.courses)
                            .font(.subheadline)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                        Text(book.title)
                            .font(.title2)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        Text(book.courses)
                            .font(.title3)
                            .foregroundColor(.primary)
                            .fontWeight(.black)
                            
                        Text("发布者:"+book.publisher.uppercased())
                            .font(.headline)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            
                    }

                    Spacer()
                    VStack{
                        HStack{
                            ForEach(0 ..< 4) { item in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.subheadline)
                            }
                        }.padding()
                        
                        Text("¥\(book.price, specifier: "%.2f")")
                            .font(.headline)
                            .bold()
                    }

                }
                .padding()
        }
        .background(Color(#colorLiteral(red: 0.2521687508, green: 0.0747280955, blue: 0.918703413, alpha: 1)).opacity(0.5)).cornerRadius(30)
//        .overlay(
//            RoundedRectangle(cornerRadius: 30)
//                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
//        )
        .padding([.top, .horizontal])
        .shadow(radius: 1, x:3, y:5)
        
    }
}
#if DEBUG
struct cardPreviews: PreviewProvider {
    static var previews: some View {
        PreviewCard(book: ViewModel.vm.publishedPool[0])
    }
}
#endif
