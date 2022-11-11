//
//  CheckOut.swift
//
//  Created by cyw on 7/11/22.
//

import SwiftUI

import PhotoLibraryPicker // Add import

import SwiftUI

struct PublishView: View {
    @State var hero = false
    @StateObject var vm = ViewModel.vm
    
    
    // picker
    @State var showActionSheet: Bool = false
    @State var pictures = [Picture]()
    
    @State var opt: [Bool] = [false, false, false, false]
    @State var showTopNav = false
    @State private var showingAlert = false
    @State var bookname: String = ""
    @State var className: String = ""
    @State var author: String = ""
    @State var tot: Int = 0
    @State var price: Double = 0
    @State var isPrivate: Bool = true
    @State var bookdescription: String = ""
    @State var notificationsEnabled: Bool = false
    @State private var previewIndex = 0
    //    func removeRows(at offsets: IndexSet) {
    //
    //        numbers.remove(atOffsets: offsets)
    //    }
    var previewOptions = ["材料科学与工程学院"
                          ,
                          "电子信息工程学院"
                          ,
                          "自动化科学与电气工程学院"
                          ,
                          "能源与动力工程学院"
                          ,
                          "航空科学与工程学院"
                          ,
                          "计算机学院"
                          ,
                          "机械工程及自动化学院"
                          ,
                          "经济管理学院"
                          ,
                          "理学院"
                          ,
                          "生物工程系"
                          ,
                          "人文社会科学学院 (公共管理学院)"
                          ,
                          "外国语学院"
                          ,
                          "交通科学与工程学院"
                          ,
                          "工程系统工程系"
                          ,
                          "宇航学院"
                          ,
                          "飞行学院"
                          ,
                          "仪器科学与光电工程学院"
                          ,
                          "软件学院"
                          ,
                          "法学院"
                          ,
                          "高等工程学院" ]
    var body: some View {
        VStack {
            
            if !hero {
                ZStack {
                    Color(#colorLiteral(red: 0.2521687508, green: 0.0747280955, blue: 0.918703413, alpha: 1))
                        .frame(width: 600, height: 600)
                        .edgesIgnoringSafeArea(.all)
                        .cornerRadius(300)
                        .offset(x: -50, y: showTopNav ? -350:-500).onTapGesture{
                            withAnimation{
                                showTopNav.toggle()
                            }
                        }
                    Color(#colorLiteral(red: 0.0617715478, green: 0.1775636971, blue: 0.9371206522, alpha: 1))
                        .frame(width: 300, height: 300)
                        .edgesIgnoringSafeArea(.all)
                        .cornerRadius(300)
                        .offset(x: -100, y: showTopNav ? -250:-400)
                        .onTapGesture{
                            withAnimation{
                                hero.toggle()
                            }
                        }
                    HStack {
                        if (showTopNav) {
                            Text("To Publish")
                                .bold()
                                .font(.title)
                        }
                        
                        Spacer()
                        Text(showTopNav ? "Close" : "Open")
                            .font(.title2).offset(x:showTopNav ? 0 : -80, y:showTopNav ? 0:-70)
                    }
                    .padding(.all, 20)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, -250)
                    
                    
                }.padding(.bottom, -440)
            }
            
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    if !hero {
                        //TrendingWeek
                        VStack{
                            HStack {
                                Text("Manage Publish")
                                    .font(.title2)
                                    .bold()
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading, 20)
                                
                                Spacer()
                                
                            }.padding(.bottom, 20)
                            // Card View
                            
                            //                            ScrollView(.horizontal, showsIndicators: false) {
                            //                                HStack {
                            //                                    ForEach(TrendingCard) { card in
                            //                                        NavigationLink(
                            //                                            destination: BookDetail(meal :card),
                            //                                            label: {
                            //                                                PreviewCard(image: "shufen", subject: "数学分析", bookName: "工科数学分析（上册）", year: "大一 信息类", author: "孙玉泉")
                            //
                            //
                            //                                            })
                            //
                            //                                    }
                            //                                    .padding(.bottom, 10)
                            //                                    .padding(.leading, 30)
                            //
                            //                                }
                            //                            }
                            
                                VStack {
                                    ForEach(vm.nowUserPublish) { card in
                                        NavigationLink(
                                            destination: BookManage(book :card),
                                            label: {
                                                TrendingBook(trendingBook: card)
                                                
                                                
                                            })
                                        
                                    }
                                    .padding(.all, 10)
                                }
                            

                            
                            
                        }.padding(.top, -90)
                            .offset(x: 0, y: showTopNav ? 190 : 90)
                        
                        
                    }
                    
                    
                    
                    
                    //Our picks
                    if hero {
                        
                        ScrollView (.vertical, showsIndicators: false){
                            VStack {
                                HStack {
                                    Spacer()
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.black.opacity(0.8))
                                        .clipShape(Circle())
                                        .edgesIgnoringSafeArea(.top)
                                        .onTapGesture{
                                            withAnimation{
                                                hero.toggle()
                                            }
                                        }
                                    
                                }
                                Text("upload Image").font(.title2)
                                

                                // photopicker 
                                VStack {
                                    Button(action: {self.showActionSheet.toggle()}) {
                                        Image(systemName: "plus")
                                            .padding()
                                            .background(Color.secondary)
                                            .mask(Circle())
                                    }.sheet(isPresented: self.$showActionSheet) {PhotoLibraryPicker(self.$pictures)}
                                    

                                }
                                List {
                                    ForEach(pictures) { picture in
                                        picture.toImage() // You can fix the size by default width: 100, height: 100
                                    }
                                }
                                VStack{
                                    
                                    HStack {
                                        Text("Config")
                                            .bold()
                                            .multilineTextAlignment(.trailing)
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                            
                                    }
                                    
                                    Form {
                                        Section(header: Text("PROFILE")) {
                                            TextField("书籍名称", text: $bookname)
                                            TextField("对应课程", text: $className)
                                            TextField("作者", text: $author)
                                            
                                            //                                            Toggle(isOn: $isPrivate) {
                                            //                                                Text("Private Account")
                                            //                                            }
                                        }
                                        
                                        
                                        
                                        
                                        Section(header: Text("Publish Amount")) {
                                            TextField("发布数量",value:$tot,format: .number)
                                            Toggle(isOn: $notificationsEnabled) {
                                                Text("Recommended?")
                                            }
                                            
                                            
                                        }
                                        Section(header: Text("Single Price")) {
                                            TextField("单价",value:$price,format: .number)
                                            
                                            
                                        }
                                        Section(header: Text("Description")) {
                                            TextField("描述",text:$bookdescription)
    
                                            
                                        }
                                        Section(header: Text("SUITED COLLEGE")) {
                                            Picker(selection: $previewIndex, label: Text("Select Suitable College")) {
                                                ForEach(0 ..< previewOptions.count) {
                                                    Text(self.previewOptions[$0])
                                                }
                                            }.pickerStyle(.menu)
                                            
                                        }
                                        
                                        Section(){
                                            Button(action: {
                                                var newBookModel = BookModel(title: bookname, publisher: vm.nowUser?.username ?? "20373456陈一文", stars: 5, price: price, BookDescription: bookdescription, BookImage: pictures.first?.toImage() ?? Image("shufen"), courses: className, historyPrice: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, price], historyPurchase: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], remain: tot, total: tot, college: "计算机学院", expand: false, author: self.author, recommend: notificationsEnabled)
                                                
                                                vm.publishBookToPool(Bk: newBookModel)
                                                withAnimation{hero.toggle()}
                                            }) {
                                                Text("Submit")
                                            }.foregroundColor(.red).alert(isPresented: $showingAlert) {
                                                Alert(title: Text("Hello SwiftUI!"),
                                                      message: Text("This is some detail message"),
                                                      dismissButton: .default(Text("OK")))
                                            }
                                        }
                                    }.frame( height: 650)

                                }.padding(.top, 50)
                                    .padding(.bottom, 150)
                            }
                            
                        }
                        
                        
                    }
                    
                    
                    Spacer()
                    
                    
                }
                
                
            }
            
            
            
            
        }
    }
}




struct SearchBar1: View {
    @State var search = ""
    @Binding public var show :Bool
    @State private var showSearch = 0;
    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.2521687508, green: 0.0747280955, blue: 0.918703413, alpha: 1))
                .frame(width: 600, height: 600)
                .edgesIgnoringSafeArea(.all)
                .cornerRadius(500)
                .offset(x: show ? -40:-50, y: show ? -250:-450)
                .shadow(radius: 3).onTapGesture {
                    withAnimation{show.toggle()}
                }
            Color(#colorLiteral(red: 0.0617715478, green: 0.1775636971, blue: 0.9371206522, alpha: 1))
                .frame(width: 300, height: 300)
                .edgesIgnoringSafeArea(.all)
                .cornerRadius(500)
                .offset(x: show ? -100: -100, y: show ? -50: -350)
                .frame(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height)*(show ? 0.35 : 0.10), alignment: .center)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation{show.toggle()}
                }
            
            
            
            
            
            VStack {
                HStack {
                    
                    
                    Spacer()
                    HStack {
                        Image(systemName: "person.circle.fill").resizable().frame(width: 30, height: 30, alignment: .leading)
                        Text("Personal Info")
                            .bold()
                            .font(.title2)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.white)
                        
                    }                            .padding(.leading)
                        .padding(.horizontal)
                        .padding(.top, -40)
                        .background(.cyan)
                        .offset( x:show ? -300:-300, y:show ? 0:-240)
                    
                }
                if show {
                    if showSearch > 0 {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .font(.title)
                            if showSearch >= 1 {
                                
                                TextField("Search\(SearchTypes.allCases[showSearch-1].rawValue)...", text: $search).font(.title3)
                            } else {
                                TextField("Search...", text: $search).font(.title3)
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
                                    //                                    Image("categ-\(String(i))").resizable().frame(width: 60, height: 60, alignment: .center)
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
                                    }
                                    
                                }
                                .onLongPressGesture{
                                    withAnimation{
                                        showSearch = 0;
                                    }
                                    
                                }
                            }
                            
                        }.offset(x:+100, y: -250)
                        HStack(spacing: 10) {
                            
                            ForEach(3 ..< 5) { i in
                                VStack {
                                    //                                    Image("categ-\(String(i))").resizable().frame(width: 60, height: 60, alignment: .center)
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
                                    }
                                    
                                }
                                .onLongPressGesture{
                                    withAnimation{
                                        showSearch = 0;
                                    }
                                    
                                }
                            }
                            
                        }.offset(x:+100, y: -250).opacity(show ? 1:0)
                        
                        
                    }
                    .offset(y: 30)
                    .shadow(radius: 1)
                    
                }
                
                
            }.offset(y:20)
            
        }
    }
}

struct PubPop: View {
    @Binding var card : BookModel
    @Binding var hero : Bool
    @State var heart = "heart.fill"
    @State private var currentIndex = 0
    @State private var tappedIndex: Int? = nil
    @State private var folded: Bool = true
    
    let cardInfos = [1, 2, 3, 4]
    class ItemInfo: Identifiable {
        internal init(name: String) {
            self.name = name
        }
        
        
        let name: String
        
        var id: String {
            name
        }
        
        
    }
    
    class IntroInfo: ItemInfo {
        internal init(image: String, subject: String, bookName: String, year: String, author: String, name: String) {
            
            self.image = image
            self.subject = subject
            self.bookName = bookName
            self.year = year
            self.author = author
            super.init(name: name)
        }
        
        var image: String
        var subject: String
        var bookName: String
        var year: String
        var author: String
        
    }
    
    class ChartInfo: ItemInfo {
        internal init(charDatas: [Double] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], name: String) {
            super.init(name: name)
            self.charDatas = charDatas
        }
        
        
        
        var charDatas:[Double] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
        
        
    }
    let colors = [
        ChartInfo(name: "chart1"),
        IntroInfo(image: "shufen", subject: "数学分析", bookName: "工科数学分析(下册)", year: "大一 信息类", author: "陈一文", name: "intro1"),
        ChartInfo(name: "chart2"),
        IntroInfo(image: "shufen", subject: "数学heihei", bookName: "工科数学分析(下册)", year: "大一 信息类", author: "陈一文", name: "intro2"),
        
        
        
    ]
    var body: some View {
        VStack {
            ZStack {
                card.BookImage
                    .resizable()
                    .frame(width: self.card.expand ? (UIScreen.main.bounds.width) : (UIScreen.main.bounds.width)*0.6 , height: self.card.expand ? (UIScreen.main.bounds.height)*0.3 : (UIScreen.main.bounds.height)*0.25 )
                    .cornerRadius(self.card.expand ? 5 : 20)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                if (self.card.expand) {
                    HStack{
                        Spacer()
                        Button(action: {
                            
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                
                                self.card.expand.toggle()
                                self.hero.toggle()
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
                
                Text(String(card.price))
                    .font(.subheadline)
                    .bold()
            }
            .padding(.bottom, 30)
            .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.leading, self.card.expand ? 10 : 20)
            .padding(.trailing, self.card.expand ? 10 : 20)
            
            
            
            
            if self.card.expand {
                
                ScrollView(.vertical, showsIndicators: true) {
                    if folded {
                        VStack{
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
                            Text("Nine years earlier, Lorem ipsum dolor sit amet,Morbi sed purus nulla. Curabitur dapibus ultrices lorem vitae tincidunt. Pellentesque quis arcu sit amet urna commodo porttitor. Aenean sit ")
                                .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                        
                        
                    }
                    
                    
                }
                
                
                
                
            }
            
            
            
        }
    }
}

struct CheckOut: View {
    @State var bubble = true
    @State var showSearchBar = false
    var body: some View {
        ScrollView{
            //            SearchBar(show: self.$showSearchBar).shadow(radius: 3, x: 3, y: 3).offset(y:-50).padding(.bottom, -500)
            ZStack {
                Color(#colorLiteral(red: 0.2521687508, green: 0.0747280955, blue: 0.918703413, alpha: 1))
                    .frame(width: 600, height: 600)
                    .edgesIgnoringSafeArea(.all)
                    .cornerRadius(300)
                    .offset(x: -50, y: -350)
                Color(#colorLiteral(red: 0.0617715478, green: 0.1775636971, blue: 0.9371206522, alpha: 1))
                    .frame(width: 300, height: 300)
                    .edgesIgnoringSafeArea(.all)
                    .cornerRadius(300)
                    .offset(x: -100, y: -250)
                
                HStack {
                    Text("To Publish")
                        .bold()
                        .font(.title)
                    Spacer()
                    Text("Close")
                        .font(.title2)
                }
                
                .padding(.all, 20)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width)
                .padding(.top, -250)
                
            }
            HStack {
                Text("Order")
                    .bold()
                    .font(.title)
                Spacer()
                Text("Close")
                    .font(.title2)
            }
            Text("Work in progress")
                .bold()
                .font(.title)
            
            Spacer()
        }
        
        .edgesIgnoringSafeArea(.all)
    }
}

struct publish_Previews: PreviewProvider {
    static var previews: some View {
        PublishView()
    }
}
