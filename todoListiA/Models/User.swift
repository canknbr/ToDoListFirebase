//
//  User.swift
//  todoListiA
//
//  Created by Can Kanbur on 15.05.2023.
//

import Foundation

struct User : Codable {
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
}
