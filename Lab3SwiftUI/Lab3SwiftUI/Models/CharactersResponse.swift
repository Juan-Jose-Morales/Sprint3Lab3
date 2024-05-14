//
//  CharactersResponse.swift
//  Lab3SwiftUI
//
//  Created by Juan jose Morales on 14/5/24.
//

import Foundation

import Foundation

struct CharactersResponse: Decodable {
    let info: Info
    let results: [Character]
}

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
