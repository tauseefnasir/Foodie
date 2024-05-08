//
//  ContentView.swift
//  Foodie
//
//  Created by Nasir on 04/11/2023.
//

import SwiftUI

struct FoodieTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
        }
    }
}

#Preview {
    FoodieTabView()
}
