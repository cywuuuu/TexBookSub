//
//  ContentView.swift
//
//  Created by cyw on 7/11/22.
//

import Foundation

struct PageModel : Identifiable {
    var id : Int
    var image : String
    var title : String
    var descrip : String
}

var BoardingData = [
    PageModel(id: 0, image: "discover", title: "the best Book Resources", descrip: "We make it simple to find your favorable books, join us and enjoy such experience."),
    PageModel(id: 1, image: "choose", title: "Choose the Best Rated Books", descrip: "We create a community for book exchange and publication, so that no worry to for your purchasing & choosing."),
    PageModel(id: 2, image: "pick", title: "Pick out your Book with Us", descrip: "We are looking to see your advocation to this textboook community.")
]
