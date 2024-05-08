//
//  HomeView.swift
//  Foodie
//
//  Created by Nasir on 04/11/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.foodies) { food in
                    FoodListCellView(food: food)
                        .onTapGesture {
                            viewModel.isShowingDetailView = true
                            viewModel.selectedFood = food
                        }
                }
                .listStyle(.plain)
                .navigationTitle("🍲 Foodie")
                .disabled(viewModel.isShowingDetailView)
            }
            .task {
                viewModel.getFoodie()
            }
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
           
            
            if (viewModel.isShowingDetailView) {
                FoodieDetailView(food: viewModel.selectedFood ?? MockData.sampleFoodie,
                                 isShowingDetailView: $viewModel.isShowingDetailView)
            }
            
            if (viewModel.isLoading) {
                LoadingView()
//                ActivityIndicator()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct FoodListCellView: View {
    let food: Foodie
    var body: some View {
        HStack {
            FoodieRemoteImage(urlString: food.imageURL)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                .frame(width: 120, height: 90)
//            AsyncImage(url: URL(string: food.imageURL)) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(8)
//                    .frame(width: 120, height: 90)
//            } placeholder: {
//                Image("food-placeholder")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(8)
//                    .frame(width: 120, height: 90)
//            }

            VStack (alignment: .leading, spacing: 5) {
                Text(food.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(food.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    HomeView()
} 
