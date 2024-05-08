//
//  OrderView.swift
//  Foodie
//
//  Created by Nasir on 04/11/2023.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                if (!order.items.isEmpty) {
                    VStack {
                        List{
                            ForEach(order.items) { order in
                                FoodListCellView(food: order)
                            }
                            .onDelete(perform: order.deleteItems)
                        }
                        .listStyle(.plain)
                        Button {
                            
                        } label: {
                            Text("$\(order.totalPrice, specifier: "%.2f")- Place Order")
                        }
                        .modifier(StandardButtonStyle())
                        .padding()
                    }
                } else {
                    EmptyState(imageName: "empty-order", message: "You have no order in your order list. \nPlease add some food")
                }
            }
            .navigationTitle("Orders")
        }
    }
    
    
}

#Preview {
    OrderView()
}
