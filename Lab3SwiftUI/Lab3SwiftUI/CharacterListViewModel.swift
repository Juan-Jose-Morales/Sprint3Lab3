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
    @Published var errorMessage: String?
    
    private let dataManager: DataManager
    
    init(dataManager: DataManager = DataManager.shared) {
        self.dataManager = dataManager
        fetchCharacters()
    }
    
    func fetchCharacters(){
        isLoading = true
        dataManager.fetchCharacters { [weak self] characters, error in
            guard let self = self else { return }
            self.isLoading = false
            if let characters = characters {
                self.characters = characters
                self.errorMessage = nil
                DispatchQueue.main.async {
                self.objectWillChange.send()
                }
            } else if let error = error {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
}
