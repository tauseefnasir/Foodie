//
//  HomeViewModel.swift
//  Foodie
//
//  Created by Nasir on 06/11/2023.
//

import SwiftUI

@MainActor final class HomeViewModel: ObservableObject {
    
    @Published var foodies: [Foodie] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedFood: Foodie?
    
//    func getFoodie() {
//        isLoading = true
//        NetworkManager.shared.getFoodie { result in
//            DispatchQueue.main.async { [self] in
//                isLoading = false
//                switch result {
//                case .success(let foodies):
//                    self.foodies = foodies
//                case .failure(let error):
//                    switch error {
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    func getFoodie() {
        isLoading = true
        
        Task {
            do {
                foodies = try await NetworkManager.shared.getFoodie()
                isLoading = false
            } catch {
                if let foError = error as? FOError {
                    switch foError {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.unableToComplete
                }
                
                isLoading = false
            }
        }
        
    }
}

