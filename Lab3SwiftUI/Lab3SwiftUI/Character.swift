//
//  Character.swift
//  Lab3SwiftUI
//
//  Created by Juan jose Morales on 8/5/24.
//

import Foundation

struct Character: Identifiable, Codable {
    
    let id: Int
    let name: String
    let status: String
    let Species: String
    let type: String
    let gender: String
    let origin: String
    let location: String
    let image: String
    let episode: [String]
    let url: String
    let create: String
}

struct origin{
    let name : String
    let url : String
}

struct location{
    let name : String
    let url: String
}
