//
//  Order.swift
//  Foodie
//
//  Created by Nasir on 08/11/2023.
//

import Foundation

final class Order: ObservableObject {
    
    @Published var items: [Foodie] = []
    
    func add(_ food: Foodie) {
        items.append(food)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    var totalPrice: Double {
        return items.reduce(0) { $0 + $1.price}
    }
}
