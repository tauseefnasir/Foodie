//
//  FoodieDetailView.swift
//  Foodie
//
//  Created by Nasir on 07/11/2023.
//

import SwiftUI

struct FoodieDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let food: Foodie
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            FoodieRemoteImage(urlString: food.imageURL)
                .frame(width: 320, height: 225)
            Text(food.name)
                .font(.title2)
                .fontWeight(.semibold)
            Text(food.description)
                .multilineTextAlignment(.center)
                .padding()
            HStack (spacing: 40) {
                NutritionInfo(title: "Calories", value: "\(food.calories) kcal")
                NutritionInfo(title: "Carbs", value: "\(food.carbs) g")
                NutritionInfo(title: "Protein", value: "\(food.protein) g")
            }
            Spacer()
            Button(action: {
                isShowingDetailView = false
                order.add(food)
            }, label: {
//                FOButton(title: "$\(food.price, specifier: "%.2f") - Add To Order")
                Text("$\(food.price, specifier: "%.2f") - Add To Order")
            })
            .modifier(StandardButtonStyle())
            .padding(.bottom)
        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                isShowingDetailView = false
            }, label: {
                XDismissButton()
            })
        }
    }
}

#Preview {
    FoodieDetailView(food: MockData.sampleFoodie, isShowingDetailView: .constant(false))
}

struct NutritionInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text("Calories")
                .fontWeight(.medium)
            Text(value)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            
        }
    }
}
