//
//  ContentView.swift
//
//  Created by cyw on 7/11/22.
//

import SwiftUI


struct ContentView: View {

//    var bookManager: BookManager
//    var userManager: UserManager
//    init () {
//        bookManager = BookManager()
//        var globUserPool = [
//            UserModel(username: "陈一文20373456", password: "123123", cart: [bookManager.publishedPool[0]:2, bookManager.publishedPool[2]:1], published: [bookManager.publishedPool[1]]),
//            UserModel(username: "test", password: "123123", cart: [:], published: [bookManager.publishedPool[1]]),
//            
//        ]
//        var userManager = UserManager(userPool: globUserPool, nowUser: globUserPool[0])
//    }
    
    
    var body: some View {
        VStack {
            OnBoarding()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
