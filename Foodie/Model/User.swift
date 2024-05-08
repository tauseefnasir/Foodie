//
//  User.swift
//  Foodie
//
//  Created by Nasir on 08/11/2023.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkins = false
    var extraRefill = false
}
