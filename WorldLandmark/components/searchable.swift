//
//  searchable.swift
//  WorldLandmark
//
//  Created by cyw on 2022/10/16.
//

import SwiftUI
struct SearchB: View {
    @State private var searchFood = ""

    private var foods = ["Chicken Chop", "Fish n Chip", "Fried Noodle", "Fried Rice", "Bread"]
    var body: some View {

        NavigationView {
            List {
                ForEach(foods, id: \.self) { food in
                    Text(food)
                }
            }.searchable(text: $searchFood, placement: SearchFieldPlacement.navigationBarDrawer(displayMode: .always))

        }.navigationBarTitle(Text("Foods"))
        
    }
}

struct SearchB_Previews: PreviewProvider {
    static var previews: some View {
        SearchB()
    }
}


