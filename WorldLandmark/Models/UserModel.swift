//
//  UserModel.swift
//  WorldLandmark
//
//  Created by cyw on 2022/11/8.
//

import Foundation
class UserModel: Identifiable , ObservableObject {
    internal init(username: String, password: String, cart: [BookModel:Int], published: [BookModel]) {
        self.username = username
        self.password = password
        self.cart = cart
        self.published = published
    }
    
    func addCart(bk: BookModel, num: Int) {
        if cart[bk] != nil {
            cart[bk]! += num
            print(cart)
        } else {
            cart[bk] = num
            print(cart)
        }
    }


    func clearCarts() {
        for (item, nnn) in cart {
            item.remain -= nnn
        }
        print(cart)
        cart.removeAll()
        print(cart)
    }
    
    
    
    var username : String
    var password : String
    @Published var cart: [BookModel:Int]
    var published: [BookModel]
    
    
}


