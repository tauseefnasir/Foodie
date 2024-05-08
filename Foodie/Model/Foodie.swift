//
//  Foodie.swift
//  Foodie
//
//  Created by Nasir on 05/11/2023.
//

import Foundation

struct Foodie: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct FoodieResponse: Decodable {
    let request: [Foodie]
}

struct MockData {
    static let sampleFoodie = Foodie(id: 01010,
                                     name: "Test Foodie",
                                     description: "this is description of foodie",
                                     price: 99.99,
                                     imageURL: "url",
                                     calories: 10,
                                     protein: 220,
                                     carbs: 90)
    static let orderItemOne = Foodie(id: 001,
                                     name: "Test Foodie 1",
                                     description: "this is description of foodie",
                                     price: 99.99,
                                     imageURL: "url",
                                     calories: 10,
                                     protein: 220,
                                     carbs: 90)
    static let orderItemTwo = Foodie(id: 002,
                                     name: "Test Foodie 2",
                                     description: "this is description of foodie",
                                     price: 99.99,
                                     imageURL: "url",
                                     calories: 10,
                                     protein: 220,
                                     carbs: 90)
    static let orderItemThree = Foodie(id: 003,
                                     name: "Test Foodie 3",
                                     description: "this is description of foodie",
                                     price: 99.99,
                                     imageURL: "url",
                                     calories: 10,
                                     protein: 220,
                                     carbs: 90)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
    static let foodies = [sampleFoodie, sampleFoodie, sampleFoodie, sampleFoodie]
}
