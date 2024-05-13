//
//  CharacterListView.swift
//  Lab3SwiftUI
//
//  Created by Juan jose Morales on 8/5/24.
//

import SwiftUI

struct CharacterListView: View {
    
    @ObservedObject var characterListViewModel: CharacterListViewModel
    
    var body: some View {
        
        VStack{
            List(characterListViewModel.characters){ character in
                NavigationLink(destination:CharacterDetailView(character: character)){
                    CharacterRowView(character : character)
                }
            }
            if characterListViewModel.isLoading{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }
        }
        .onAppear{
            characterListViewModel.fetchCharacters()
        }
        .navigationTitle("Personajes")
    }
}

