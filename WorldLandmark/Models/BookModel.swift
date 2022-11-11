//
//  Card.swift
//
//  Created by cyw on 7/11/22.
//
import Foundation
import SwiftUI


class BookModel : Identifiable, Hashable, Comparable, ObservableObject {
    static func < (lhs: BookModel, rhs: BookModel) -> Bool {
        lhs.id < rhs.id
    }
    
    
    static func == (lhs: BookModel, rhs: BookModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }
    
    
    
    internal init(title: String, publisher: String, stars: Int, price: Double, BookDescription: String, BookImage: Image, courses: String, historyPrice: [Double], historyPurchase: [Int], remain: Int, total: Int, college: String, expand: Bool, author: String, recommend: Bool) {
        self.id = BookModel.idcnt
        BookModel.idcnt += 1
        self.title = title
        self.publisher = publisher
        self.stars = stars
        self.price = price
        self.BookDescription = BookDescription
        self.BookImage = BookImage
        self.courses = courses
        self.historyPrice = historyPrice
        self.historyPurchase = historyPurchase
        self.remain = remain
        self.total = total
        self.college = college
        self.expand = expand
        self.author = author
        self.recommend = recommend
    }
    

    static var idcnt = 0;


    var id : Int
    var title : String
    var publisher : String
    var stars : Int
    var price : Double
    var BookDescription: String
    var BookImage: Image
    var courses: String
    var historyPrice: [Double]
    var historyPurchase: [Int]
    var remain: Int
    @State var total: Int
    var college: String
    var author:String
    var expand : Bool
    var recommend : Bool
}


enum SearchTypes : String, CaseIterable  {
    case course = "课程查询"
    case college = "院系查询"
    case bookName = "书名查询"
    case publisher = "发布者查询"
    case all
}
var earchTypes = ["课程查询","院系查询","书名查询","发布者查询"]
var SearchSym = ["timer.square", "timer.square", "books.fill", "person.fill"]
