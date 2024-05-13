//
//  CharacterListViewModel.swift
//  Lab3SwiftUI
//
//  Created by Juan jose Morales on 8/5/24.
//

import Foundation

class CharacterListViewModel: ObservableObject{
    
    @Published var characters: [Character] = []
    @Published var isLoading = false
    
    func fetchCharacters(){
        
        isLoading = true
        DataManager.shared.fetchCharacters { characters, error in
            if let characters = characters {
                self.characters = characters
            } else if let error = error {
                print("Error buscando personajes: \(error)")
            }
            self.isLoading = false
        }
    }
    
}
