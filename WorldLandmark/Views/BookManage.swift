//
//  BookDetail.swift
//
//
//  Created by cyw on 7/11/22.
//

import SwiftUI

struct BookManage: View {
    @StateObject var vm = ViewModel.vm
    @State var book : BookModel
    @State var heart = "heart.fill"
    @Environment(\.presentationMode) var presentationMode

    @State var newDes :String
    @State var newTot: Int
    init(book: BookModel) {
        self._book = State(initialValue: book)
        self._newDes = State(initialValue: book.BookDescription)
        self._newTot = State(initialValue: book.total)
    }
    class ItemInfo: Identifiable {
        internal init(id: Int) {
            self.id = id
        }
        
        
        var id: Int
        
        
    }
    
    var cardInfos : [ItemInfo] {
        get {
            return [ItemInfo(id: 0), ItemInfo(id: 1), ItemInfo(id: 2)]
        }
    }
    
    
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                GeometryReader{reader in
                    book.BookImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                        .offset(y: -reader.frame(in: .global).minY)
                        // going to add parallax effect....
                        .frame(width: UIScreen.main.bounds.width, height:  reader.frame(in: .global).minY + 300)
                    
                }
                .frame(height: 280)
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text(book.title)
                        .font(.system(size: 35, weight: .bold))
                    
                    
                    HStack(spacing: 10){
                        
                        ForEach(1..<book.stars){_ in
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        ForEach(book.stars..<6){_ in
                            
                            Image(systemName: "star")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    HStack {
                        Text(book.publisher)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top,5)
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.spring(dampingFraction: 0.5)) {
                                heart = "heart"
                            }
                        }, label: {
                            Image(systemName: heart)
                                .font(.largeTitle)
                                .foregroundColor(.red)
                            
                        })
                        .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                    Text("Description")
                        .font(.system(size: 25, weight: .bold))
                    
                    TextField(newDes, text: $newDes)
                        .padding(.top, 10)
                        .fixedSize(horizontal: false, vertical: true)
        
                        
                    
                    
                    HStack {
                        Text("Total Adjustment")
                            .font(.title3)
                            .bold()
                        Spacer()
                        

                        Stepper("",
                                onIncrement: {
                            newTot += 1
                            print(newTot)
                        }, onDecrement: {
                            if newTot > book.remain {
                                newTot -= 1
                            }
                            
                        })

                    }.padding(.top, 10)

                    HStack {
                        Text("Remain/Total ")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Text("\(book.remain)/\(newTot)")
                            .font(.title2)
                            .bold()
                    }
                    .padding(.top, 10)
                }
                .padding(.top, 25)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
                .offset(y: -35)
                CardStack(cardInfos, currentIndex: $currentIndex) { cardInfo in
                    if cardInfo.id == 1 {
                        upperChart(val: book.historyPrice, theme: "价格")
                            .padding(50)
                    } else if cardInfo.id == 2 {
                        upperChart(val: book.historyPurchase.map({Double($0)}), theme:"销量")
                            .padding(50)
                    } else{
                        PreviewCard(book: book).padding(50)
                    }
                    
                }.offset(y:-30)
            })
            
            

            
            Spacer()
            
            HStack{
                Spacer()
                HStack {
                    Button(action: {
                        book.BookDescription = newDes
                        book.total = newTot
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Confirm Edit")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                        
                    })
                    Spacer()
                    Button(action: {
                        vm.deletePublish(Bk: book)
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Delete")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                            .background(Color.red)
                            .cornerRadius(10)
                        
                    })
                }

                Spacer()
            }
            .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            .edgesIgnoringSafeArea(.all)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
    
}

//struct BookManage_Previews: PreviewProvider {
//    static var previews: some View {
//        BookManage(book: bookManager.publishedPool[0])
//    }
//}
