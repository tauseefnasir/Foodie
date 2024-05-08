//
//  FoodieApp.swift
//  Foodie
//
//  Created by Nasir on 04/11/2023.
//

import SwiftUI

@main
struct FoodieApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            FoodieTabView().environmentObject(order)
        }
    }
}
