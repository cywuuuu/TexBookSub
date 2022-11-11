//
//  HomeView.swift
//
//  Created by cyw on 7/11/22.
//

import SwiftUI
import Foundation
struct HomeView: View {
    @StateObject var vm = ViewModel.vm
    @State var hero = false

    
    @State var opt: [Bool] = [false, false, false, false]
    @State var showSearchBar = false
    @State var searchKey = ""
    @State private var showSearch = 0
    var body: some View {
        VStack {
            if !hero {
                VStack {
                    ZStack {
                        
                        Color(#colorLiteral(red: 0.2521687508, green: 0.0747280955, blue: 0.918703413, alpha: 1))
                            .frame(width: 600, height: 600)
                            .edgesIgnoringSafeArea(.all)
                            .cornerRadius(300)
                            .offset(x: -50, y: showSearchBar ? -350:-500).onTapGesture{
                                withAnimation{
                                    showSearchBar.toggle()
                                }
                            }
                        Color(#colorLiteral(red: 0.0617715478, green: 0.1775636971, blue: 0.9371206522, alpha: 1))
                            .frame(width: 300, height: 300)
                            .edgesIgnoringSafeArea(.all)
                            .cornerRadius(300)
                            .offset(x: -100, y: showSearchBar ? -250:-400)
                            .onTapGesture{
                                withAnimation{
                                    showSearchBar.toggle()
                                }
                            }
                        
                        
                        VStack {
                            HStack {
                                
                                
                                Spacer()
                                HStack {
                                    Image(systemName: "info.circle").resizable().frame(width: 30, height: 30, alignment: .leading)
                                    Text("Search Info")
                                        .bold()
                                        .font(.title2)
                                        .multilineTextAlignment(.trailing)
                                        .foregroundColor(.white)
                                    
                                }                            .padding(.leading)
                                    .padding(.horizontal)
                                    .padding(.top, -80)
                                    .background(.cyan)
                                    .offset( x:showSearchBar ? -300:-300, y:showSearchBar ? -80:-240)
                                
                            }
                            if showSearchBar {
                                if showSearch > 0 {
                                    HStack {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.gray)
                                            .font(.title)
                                        if showSearch >= 1 {
                                            
                                            TextField("Search\(SearchTypes.allCases[showSearch-1].rawValue)...", text: $searchKey).font(.title3).onSubmit({vm.searchKey = self.searchKey})
                                        } else {
                                            TextField("Search...", text: $searchKey).font(.title3).onSubmit({vm.searchKey = self.searchKey})
                                        }
                                        
                                        
                                        
                                        
                                    }
                                    .frame(width:  ( UIScreen.main.bounds.width)*0.85, height: 40, alignment: .leading)
                                    .padding(.leading, 20)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                }
                                
                                //Categories
                                VStack{
                                    
                                    // Categories View
                                    HStack(spacing: 10) {
                                        
                                        ForEach(1 ..< 3) { i in
                                            VStack {

                                                Text(SearchTypes.allCases[Int(i)-1].rawValue)
                                                    .font(.subheadline)
                                                    .bold()
                                            }
                                            .frame(width: 80, height: 50, alignment: .center)
                                            .background(Color.white.opacity(0.7))
                                            .cornerRadius(45)
                                            .onTapGesture{
                                                withAnimation{
                                                    showSearch = i;
                                                    vm.displayMode = SearchTypes.allCases[Int(i)-1]
                                                }
                                                
                                            }
                                            .onLongPressGesture{
                                                withAnimation{
                                                    showSearch = 0;
                                                    vm.displayMode = SearchTypes.all
                                                }
                                                
                                            }
                                        }
                                        
                                    }.offset(x:+100, y: -250)
                                    HStack(spacing: 10) {
                                        
                                        ForEach(3 ..< 5) { i in
                                            VStack {

                                                Text(SearchTypes.allCases[Int(i)-1].rawValue)
                                                    .font(.subheadline)
                                                    .bold()
                                            }
                                            .frame(width: 80, height: 50, alignment: .center)
                                            .background(Color.white.opacity(0.7))
                                            .cornerRadius(45)
                                            .onTapGesture{
                                                withAnimation{
                                                    showSearch = i;
                                                    vm.displayMode = SearchTypes.allCases[Int(i)-1]
                                                }
                                                
                                            }
                                            .onLongPressGesture{
                                                withAnimation{
                                                    showSearch = 0;
                                                    vm.displayMode = SearchTypes.all
                                                }
                                                
                                            }
                                        }
                                        
                                    }.offset(x:+100, y: -250).opacity(showSearchBar ? 1:0)
                                    
                                    
                                }
                                .offset(y: 30)
                                .shadow(radius: 1)
                                
                            }
                            
                            
                        }.offset(y:20)
                        
                    }
                        .shadow(radius: 3, x: 3, y: 3).offset(y:-50).padding(.bottom, -510).background(Color.white.opacity(0.1))
                    
                    
                }
                
                
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    if !hero {
                        //TrendingWeek
                        VStack{
                            HStack {
                                Text("favored list")
                                    .font(.title2)
                                    .bold()
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading, 20)
                                
                                Spacer()
                                
                            }.offset(y:40).padding(.top, 30).padding(.bottom, 20)
                            // Card View
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(vm.trending) { card in
                                        NavigationLink(
                                            destination: BookDetail(book :card),
                                            label: {
                                                PreviewCard( book: card)
                                                
                                                
                                            })
                                        
                                    }
                                    .padding(.bottom, 10)
                                    .padding(.leading, 30)
                                    
                                }
                            }
                        }.padding(.top, -50)
                        
                        
                    }
                    
                    
                    
                    
                    //Our picks
                    VStack{
                        HStack {
                            Text("Our picks")
                                .bold()
                                .multilineTextAlignment(.trailing)
                                .padding(.leading, 20)
                            
                            Spacer()
                            Text("View all >")
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                                .padding(.trailing, 20)
                        }
                        
                        
                        
                        // Card View
                        VStack(spacing: 100) {
                            ForEach(0..<self.$vm.searchRes.count){i in
                                GeometryReader{g in
                                    OurPicks(card: self.$vm.searchRes[i], hero: self.$hero)
                                    
                                        .offset(y: self.vm.searchRes[i].expand ? -g.frame(in: .global).minY : 0)
                                        .opacity(self.hero ? (self.vm.searchRes[i].expand ? 1 : 0) : 1)
                                    
                                    
                                }
                                // going to increase height based on expand...
                                .frame(height: self.vm.searchRes[i].expand ? UIScreen.main.bounds.height : 250)
//                                .simultaneousGesture(DragGesture(minimumDistance: self.data[i].expand ? 0 : 800).onChanged({ (_) in
//
//                                    print("dragging")
//                                }))
                            }
                            
                            
                        }
                        
                    }.padding(.top, 50)
                        .padding(.bottom, 150)
                    
                    Spacer()
                    
                    
                }.offset(x: 0, y: showSearchBar ? 230 : 0)
                
                
            }
            
            


            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}



struct OurPicks: View {
    @StateObject var vm = ViewModel.vm
    @Binding var card : BookModel
    @Binding var hero : Bool
    @State var heart = "heart.fill"
    @State private var currentIndex = 0
    @State private var tappedIndex: Int? = nil
    @State private var folded: Bool = true
    
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
    
    @State private var quantity = 1
    var body: some View {
        VStack {
            ZStack {
                card.BookImage
                    .resizable()
                    .frame(width: self.card.expand ? (UIScreen.main.bounds.width) : (UIScreen.main.bounds.width)*0.6 , height: self.card.expand ? (UIScreen.main.bounds.height)*0.3 : (UIScreen.main.bounds.height)*0.25 )
                    .cornerRadius(self.card.expand ? 5 : 20)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                            if !self.card.expand{
                                self.hero.toggle()
                                self.card.expand.toggle()
                                quantity = 1
                            }
                        }
                        
                    }
                if (self.card.expand) {
                    HStack{
                        Spacer()
                        Button(action: {
                            
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                
                                self.card.expand.toggle()
                                self.hero.toggle()
                                quantity = 1
                            }
                            
                        }) {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.8))
                                .clipShape(Circle())
                            
                        }
                    }
                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
            }.edgesIgnoringSafeArea(.top)
            
            
            
            
            
            HStack {
                Text(card.title)
                    .bold()
                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding(.leading, self.card.expand ? 10 : 20)
            
            HStack {
                Text(card.publisher)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.leading, self.card.expand ? 20 : 30)
                Spacer()
            }
            
            HStack {
                ForEach(0 ..< card.stars) { item in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.subheadline)
                }
                Spacer()
                Text("¥\(card.price * Double(quantity), specifier: "%.2f")")
                    .font(.title2)
                    .bold()
                
            }
            .padding(.bottom, 30)
            .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.leading, self.card.expand ? 10 : 20)
            .padding(.trailing, self.card.expand ? 10 : 20)
            
            if (card.expand) {
                Stepper("Quantity:\(quantity)",
                        
                    onIncrement: {
                    if card.remain + quantity < card.total {
                        quantity += 1
                    }
                    print(quantity)
                }, onDecrement: {
                    if quantity > 0 {
                        quantity -= 1
                    }
                }).padding(.horizontal, 10)
            }

            
            
            
            
            
            if self.card.expand {
                
                
                ScrollView {
                    if folded {
                        HStack {
                            Text("Description")
                                .font(.title)
                                .bold()
                                .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            Spacer()
                            Button(action: {
                                withAnimation(.spring(dampingFraction: 0.5)) {
                                    heart = "heart"
                                }
                            }, label: {
                                Image(systemName: heart)
                                    .font(.title)
                                    .foregroundColor(.red)
                                
                            })
                            .padding(.trailing, 30)
                        }
                        
                        Text(card.BookDescription.dropFirst(0).prefix(40))
                            .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    
                    CardStack(cardInfos, currentIndex: $currentIndex) { cardInfo in
                        if cardInfo.id == 1 {
                            upperChart(val: card.historyPrice, theme: "价格")
                                .padding(50)
                        } else if cardInfo.id == 2 {
                            upperChart(val: card.historyPurchase.map({Double($0)}), theme:"销量")
                                .padding(50)
                        } else{
                            PreviewCard(book: card).padding(50)
                        }
                        
                    }.offset(y:folded ? 0 : -65).onTapGesture{                                            withAnimation{
                        folded.toggle()
                    }}
                    
                    

                }
                
                
                    Spacer()
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            vm.buyBook(bk: card, amount: quantity)
                            quantity = 0
                        }, label: {
                            Text("Add to Cart")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 100)
                                .background(Color.orange)
                                .cornerRadius(10)
                            
                        })
                        Spacer()
                    }
                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    .edgesIgnoringSafeArea(.all)
                    .background(Color.white.edgesIgnoringSafeArea(.all))
                

                
                
            }
            
            
        
            
            
        }
    }
}

