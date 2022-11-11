//
//  UserManager.swift
//  WorldLandmark
//
//  Created by cyw on 2022/11/8.
//

import Foundation
import SwiftUI
@MainActor class ViewModel : ObservableObject{

    static let vm = ViewModel()
    @Published var publishedPool:[BookModel]
    @Published var userPool: [UserModel]
    @Published var nowUser: UserModel?
    @Published var displayMode: SearchTypes = SearchTypes.all
    @Published var searchKey: String = ""
//
//    let savePublishedPoolPath = FileManager.documentsDirectory.appendingPathComponent("SavedPublishedPool")
//    let saveUserPoolPath = FileManager.documentsDirectory.appendingPathComponent("SavedUsersPool")
//    let saveNowUserPath = FileManager.documentsDirectory.appendingPathComponent("SavedNowUser")
    init() {
        let tmp =
                        [
                            BookModel(title: "航空飞行器飞行动力学", publisher: "教务处", stars: 5, price: 12.00, BookDescription: "《航空飞行器飞行动力学》系统地介绍航空飞行器（飞机、有翼导弹）的飞行动力学特性，内容结合工程实际，反映现代飞行动力学的一些新现象、新特点。全书分两大部分。前5章着重分析飞行器质心运动规律，确定飞机的基本飞行性能、机动性能、敏捷性和导弹的轨迹特性。后7章着重分析刚性飞行器的运动特性，讨论飞行器的平衡、静稳定性和静操纵性、动稳定性和动操纵性；飞行器+自动器系统动力学特性；飞机飞行品质和导弹命中准确度分析等。《航空飞行器飞行动力学》可作为飞行器设计专业大学本科生的教材，对于飞行器设计和使用部分的工程技术人员也有参考价值。该书系统地介绍航空飞行器（飞机、有翼导弹）的飞行动力学特性，内容结合工程实际，反映现代飞行动力学的一些新现象、新特点。", BookImage: Image("feixingdongli"), courses: "飞行动力学", historyPrice: [12.0, 11.5, 11.9, 14.5, 15, 13, 12.0, 11.5, 11.9, 12.5, 13, 12], historyPurchase: [0, 2, 10, 11, 14, 15, 19, 20, 30, 32, 40, 41, 44, 45], remain: 55, total: 100, college: "航空科学与工程学院", expand: false, author: "方振平", recommend: true),
                            BookModel(title: "Verilog 设计实践", publisher: "cyw20373456", stars: 4, price: 30.00, BookDescription: "二手出！加急！😣介绍硬件描述语言Verilog HDL及电路设计方法，主要内容包括： Verilog层次化设计、Verilog基本语法、Verilog行为描述、组合逻辑建模、时序逻辑建模、为级仿真模型建模、各层次Verilog描述形式与电路建模、任务和函数、编译预处理、Verilog设计与综合中的陷阱、异步设计与同步设计的时序分析。", BookImage: Image("verilog"), courses: "计算机组成原理", historyPrice: [0, 30.0, 30, 30, 30, 30, 30, 30, 30,30, 30, 30], historyPurchase: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], remain: 2, total: 2, college: "计算机学院", expand: false, author: "Michael D.Ciletti", recommend: true),
        
                            BookModel(title: "微机原理和接口", publisher: "欧阳皓东", stars: 3, price: 20.00, BookDescription: "二手，9成新：介绍了微机系统原理、Intel系列微处理器结构、8086指令系统和汇编语言程序设计、主存储器及与CPU的接口、输入输出、中断以及常用的微机接口电路和数模(D/A)转换与模数(A/D)转换接口。", BookImage: Image("weiji"), courses: "计算机组成原理", historyPrice: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 20], historyPurchase: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], remain: 1, total: 1, college: "计算机学院", expand: false, author: "David Patterson", recommend: true),
        
                            BookModel(title: "工科数学分析同步辅导（上册）", publisher: "教务处", stars: 4, price: 20.00, BookDescription: "《工科数学分析》是2019年北京航空航天大学出版社出版的图书，作者是孙玉泉", BookImage: Image("shufenxiti"), courses: "工科数学分析", historyPrice: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 20], historyPurchase: [0, 40, 120, 142, 163, 185, 205, 220, 230, 240, 245, 250], remain: 50, total: 300, college: "北航学院", expand: false, author: "孙玉泉、冯伟杰、薛玉梅", recommend: true),
                            BookModel(title: "工科数学分析（上册）", publisher: "教务处", stars: 4, price: 25.00, BookDescription: "全书包含三千多道习题和三百多道例题，几乎涵盖了工科院校高等数学课程（除解析几何处）的所有内容，并对课程中要求牢固掌握的最重要章节（求极限、微分法、函数作图、积分法、定积分的应用、级数和微分方程的解法）给了特别关注。除此之外，书中还包括场论，傅里叶方法和近似计算的习题。", BookImage: Image("shufen"), courses: "工科数学分析", historyPrice: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 25], historyPurchase: [0, 40, 120, 142, 163, 185, 205, 220, 230, 240, 245, 250], remain: 50, total: 300, college: "北航学院", expand: false, author: "孙玉泉、冯伟杰、薛玉梅", recommend: false),
                            BookModel(title: "电路实验教程", publisher: "李灿", stars: 4, price: 25.00, BookDescription: "不想要了，买错了，🥹，《电路实验教程》主要内容为仪表的使用与减小误差的方法、直流电路测量、动态电路测量、正弦稳态电路测量、非正弦周期电路测量、双口网络参数测定及计算机辅助分析等。", BookImage: Image("dianluexp"), courses: "电路分析", historyPrice: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 20], historyPurchase: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], remain: 1, total: 1, college: "电子信息学院", expand: false, author: "王灿、吴屏", recommend: false),
        
                            BookModel(title: "航空航天概论", publisher: "cyw20373456", stars: 5, price: 15.00, BookDescription: "🥹速出，略", BookImage: Image("hanggai"), courses: "航空航天概论", historyPrice: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 20], historyPurchase: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], remain: 1, total: 1, college: "所有", expand: false, author: "王云", recommend: false),
                        ]
        
        let me = UserModel(username: "cyw20373456", password: "123123", cart: [tmp[0]:2, tmp[2]:4], published: [tmp[1], tmp[6]])
        publishedPool = tmp
        userPool = [me, ]
        nowUser = me
        searchRes = tmp
//        do {
//            let data = try Data(contentsOf: saveUserPoolPath)
//            userPool = try JSONDecoder().decode([UserModel].self, from: data)
//            let dataNow = try Data(contentsOf: saveNowUserPath)
//            nowUser = try JSONDecoder().decode(UserModel.self, from: dataNow)
//            let data2 = try Data(contentsOf: savePublishedPoolPath)
//            publishedPool = try JSONDecoder().decode([BookModel].self, from: data2)
//            getSearchRes()
//
//        } catch {
//            userPool = []
//            nowUser = UserModel(username: "cyw20373456", password: "123123", cart: [:], published: [])
//            publishedPool =
//                [
//                    BookModel(title: "航空飞行器飞行动力学", publisher: "教务处", stars: 5, price: 12.00, BookDescription: "《航空飞行器飞行动力学》系统地介绍航空飞行器（飞机、有翼导弹）的飞行动力学特性，内容结合工程实际，反映现代飞行动力学的一些新现象、新特点。全书分两大部分。前5章着重分析飞行器质心运动规律，确定飞机的基本飞行性能、机动性能、敏捷性和导弹的轨迹特性。后7章着重分析刚性飞行器的运动特性，讨论飞行器的平衡、静稳定性和静操纵性、动稳定性和动操纵性；飞行器+自动器系统动力学特性；飞机飞行品质和导弹命中准确度分析等。《航空飞行器飞行动力学》可作为飞行器设计专业大学本科生的教材，对于飞行器设计和使用部分的工程技术人员也有参考价值。该书系统地介绍航空飞行器（飞机、有翼导弹）的飞行动力学特性，内容结合工程实际，反映现代飞行动力学的一些新现象、新特点。", BookImage: Image("feixingdongli"), courses: "飞行动力学", historyPrice: [12.0, 11.5, 11.9, 14.5, 15, 13, 12.0, 11.5, 11.9, 12.5, 13, 12], historyPurchase: [0, 2, 10, 11, 14, 15, 19, 20, 30, 32, 40, 41, 44, 45], remain: 55, total: 100, college: "航空科学与工程学院", expand: false, author: "方振平", recommend: true),
//                    BookModel(title: "Verilog 设计实践", publisher: "陈一文20373456", stars: 4, price: 30.00, BookDescription: "二手出！加急！😣介绍硬件描述语言Verilog HDL及电路设计方法，主要内容包括： Verilog层次化设计、Verilog基本语法、Verilog行为描述、组合逻辑建模、时序逻辑建模、为级仿真模型建模、各层次Verilog描述形式与电路建模、任务和函数、编译预处理、Verilog设计与综合中的陷阱、异步设计与同步设计的时序分析。", BookImage: Image("verilog"), courses: "计算机组成原理", historyPrice: [0, 30.0, 30, 30, 30, 30, 30, 30, 30,30, 30, 30], historyPurchase: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], remain: 2, total: 2, college: "计算机学院", expand: false, author: "Michael D.Ciletti", recommend: true),
//
//                    BookModel(title: "微机原理和接口", publisher: "欧阳皓东", stars: 3, price: 20.00, BookDescription: "二手，9成新：介绍了微机系统原理、Intel系列微处理器结构、8086指令系统和汇编语言程序设计、主存储器及与CPU的接口、输入输出、中断以及常用的微机接口电路和数模(D/A)转换与模数(A/D)转换接口。", BookImage: Image("weiji"), courses: "计算机组成原理", historyPrice: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 20], historyPurchase: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], remain: 1, total: 1, college: "计算机学院", expand: false, author: "David Patterson", recommend: true),
//
//                    BookModel(title: "工科数学分析同步辅导（上册）", publisher: "教务处", stars: 4, price: 20.00, BookDescription: "《工科数学分析》是2019年北京航空航天大学出版社出版的图书，作者是孙玉泉", BookImage: Image("shufenxiti"), courses: "工科数学分析", historyPrice: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 20], historyPurchase: [0, 40, 120, 142, 163, 185, 205, 220, 230, 240, 245, 250], remain: 50, total: 300, college: "北航学院", expand: false, author: "孙玉泉、冯伟杰、薛玉梅", recommend: true),
//                    BookModel(title: "工科数学分析（上册）", publisher: "教务处", stars: 4, price: 25.00, BookDescription: "全书包含三千多道习题和三百多道例题，几乎涵盖了工科院校高等数学课程（除解析几何处）的所有内容，并对课程中要求牢固掌握的最重要章节（求极限、微分法、函数作图、积分法、定积分的应用、级数和微分方程的解法）给了特别关注。除此之外，书中还包括场论，傅里叶方法和近似计算的习题。", BookImage: Image("shufen"), courses: "工科数学分析", historyPrice: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 25], historyPurchase: [0, 40, 120, 142, 163, 185, 205, 220, 230, 240, 245, 250], remain: 50, total: 300, college: "北航学院", expand: false, author: "孙玉泉、冯伟杰、薛玉梅", recommend: false),
//                    BookModel(title: "电路实验教程", publisher: "李灿", stars: 4, price: 25.00, BookDescription: "不想要了，买错了，🥹，《电路实验教程》主要内容为仪表的使用与减小误差的方法、直流电路测量、动态电路测量、正弦稳态电路测量、非正弦周期电路测量、双口网络参数测定及计算机辅助分析等。", BookImage: Image("dianluexp"), courses: "电路分析", historyPrice: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 20], historyPurchase: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], remain: 1, total: 1, college: "电子信息学院", expand: false, author: "王灿、吴屏", recommend: false),
//
//                    BookModel(title: "航空航天概论", publisher: "陈一文20373456", stars: 5, price: 15.00, BookDescription: "🥹速出，略", BookImage: Image("hanggai"), courses: "航空航天概论", historyPrice: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 20], historyPurchase: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], remain: 1, total: 1, college: "所有", expand: false, author: "王云", recommend: false),
//                ]
//        }
    }
    
    
   func savePublishPool() {
       do {
           let data1 = try JSONEncoder().encode(publishedPool)
           try data1.write(to: savePublishedPoolPath, options: [.atomic, .completeFileProtection])
       } catch {
           print("Unable to save data.")
       }
   }

   func saveUser() {
       do {
           let data1 = try JSONEncoder().encode(userPool)
           try data1.write(to: saveUserPoolPath, options: [.atomic, .completeFileProtection])
           let data2 = try JSONEncoder().encode(nowUser)
           try data2.write(to: saveNowUserPath, options: [.atomic, .completeFileProtection])
       } catch {
           print("Unable to save data.")
       }
   }
    

    
    func getNowUsersCart() -> [BookModel:Int] {
        return nowUser?.cart ?? [:]
    }
    
    var nowUserCart:[BookModel:Int] {
        get {
            nowUser?.cart ?? [:]
        }
    }

    
    func getNowUsersTot() -> Double {
        var tot :Double = 0
        if nowUser?.cart == nil {
            return 0.0
        }
        for (item, nnn) in nowUser!.cart {
            tot += item.price * Double(nnn)
        }
        return tot
    }
    
    func makeregister(username: String, password: String) -> Bool{
        if (userPool.contains(where: {$0.username == username})) {
            return false
        } else {
            userPool.append(UserModel(username: username, password: password, cart: [:], published: []))
//            saveUser()
            return true
        }
    }
    
    func login(username: String, password: String) -> (Bool, String){
        if let user = userPool.first(where: {$0.username == username}) {
           // do something with foo
            if user.password == password {
                nowUser = user
                return (true, "Login Succeeded")
            } else {
                return (false, "Password mismatched")
            }
        } else {
           // item could not be found
            return (false, "Username Not Found \nPlease Register First")
        }
    }
    
    func buyBook(bk: BookModel, amount: Int) {
        print("buy book", bk, amount)
        nowUser?.addCart(bk: bk, num: amount)
//        saveUser()
    }
    
    func nowUserClearCart() {
        print("clear cart")
        
        nowUser?.clearCarts()
//        saveUser()
    }
    
    
    func publishBookToPool(Bk:BookModel) {
        publishedPool.append(Bk)
//        savePublishPool()
    }
    
    func deletePublish(Bk:BookModel) {
        publishedPool = publishedPool.filter { $0 !== Bk }
//        savePublishPool()
    }
    
    var nowUserPublish: [BookModel] {
        get {
            return publishedPool.filter{$0.publisher == nowUser?.username}
        }
    }
    
    var trending: [BookModel] {
        get {
            return publishedPool.filter{
                $0.recommend
            }
        }
    }
    

    @Published var searchRes: [BookModel]
    func getSearchRes() {
            switch displayMode {
            case .course:
                searchRes = publishedPool.filter({ $0.courses.hasPrefix(searchKey)})
            case .college:
                searchRes = publishedPool.filter({ $0.college.hasPrefix(searchKey)})
            case .bookName:
                searchRes = publishedPool.filter({ $0.title.hasPrefix(searchKey)})
            case .publisher:
                searchRes =  publishedPool.filter({ $0.publisher.hasPrefix(searchKey)})
            case .all:
                searchRes = publishedPool
            }
        
    }
    @Published var cleared: Bool = false
    func clearCart() {
        nowUser?.clearCarts()
    }
    
}


