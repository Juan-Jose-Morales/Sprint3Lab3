//
//  CharacterDetailViewModel.swift
//  Lab3SwiftUI
//
//  Created by Juan jose Morales on 14/5/24.
//

import Foundation

class CharacterDetailViewModel: ObservableObject {
    @Published var character: Character
    @Published var characterDetails: [(String, String)] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    init(character: Character) {
        self.character = character
    }
    
    func fetchCharacterDetails() {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
            self.isLoading = false
            self.characterDetails = [
                ("ID", "\(self.character.id)"),
                ("Estado", self.character.status),
                ("Especie", self.character.species),
                ("Tipo", self.character.type),
                ("Género", self.character.gender),
                ("Origen", self.character.origin.name),
                ("Ubicación", self.character.location.name)
            ]
        }
    }
}
