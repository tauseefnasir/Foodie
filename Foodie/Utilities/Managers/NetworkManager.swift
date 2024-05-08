//
//  NetworkManager.swift
//  Foodie
//
//  Created by Nasir on 06/11/2023.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let foodieURL = baseURL + "appetizers"
    
//    func getFoodie(completed: @escaping (Result<[Foodie], FOError>) -> Void) {
//        guard let url = URL(string: foodieURL) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            if let _ = error {
//                completed(.failure(.unableToComplete))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                completed(.failure(.invalidData))
//                return
//            }
//            
//            do {
//                let decodedResponse = try JSONDecoder().decode(FoodieResponse.self, from: data)
//                completed(.success(decodedResponse.request))
//            } catch {
//                completed(.failure(.invalidData))
//            }
//            
//        }
//        
//        task.resume()
//    }
    
    func getFoodie() async throws -> [Foodie] {
        guard let url = URL(string: foodieURL) else {
            throw FOError.invalidURL
        }
        let (data, response) = try await  URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FOError.invalidResponse
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(FoodieResponse.self, from: data)
            return decodedResponse.request
        } catch {
            throw FOError.unableToComplete
        }
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
    
    
    private init() {}
}
