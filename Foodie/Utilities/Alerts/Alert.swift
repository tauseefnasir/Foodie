//
//  Alert.swift
//  Foodie
//
//  Created by Nasir on 06/11/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: -Network Error
    
    static let invalidURL           = AlertItem(title: Text("Server Error"),
                                                message: Text("Somnething is wrong with the server. Please contact support."),
                                                dismissButton: .cancel())
    static let invalidResponse      = AlertItem(title: Text("Server Error"),
                                                message: Text("Somnething is wrong with the server. Please contact support."),
                                                dismissButton: .default(Text("Ok")))
    static let invalidData          = AlertItem(title: Text("Server Error"),
                                                message: Text("Somnething is wrong with the server. Please contact support."),
                                                dismissButton: .cancel())
    static let unableToComplete     = AlertItem(title: Text("Server Error"),
                                                message: Text("Could not make a request at the time. Please make sure you are connect to the network."),
                                                dismissButton: .default(Text("Ok")))
    
    //MARK: - Account Alerts
    static let invalidEmail         = AlertItem(title: Text("Invalid Email"),
                                                message: Text("Email address must be a valid email address."),
                                                dismissButton: .cancel())
    static let incompleteField         = AlertItem(title: Text("Incomplete Fields"),
                                                message: Text("Please ensure all fields in the form have been filled out."),
                                                dismissButton: .cancel())
    static let invalidUserData         = AlertItem(title: Text("Profile Error"),
                                                message: Text("There was a problem saving your profile"),
                                                dismissButton: .cancel())
    static let userSaveSuccess         = AlertItem(title: Text("Profile Saved"),
                                                message: Text("Your prfile successfuly saved"),
                                                   dismissButton: .default(Text("Ok")))
}
