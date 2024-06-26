//
//  CharacterListView.swift
//  Lab3SwiftUI
//
//  Created by Juan jose Morales on 8/5/24.
//

import SwiftUI

struct CharacterListView: View {
    
    @ObservedObject var viewModel: CharacterListViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                if viewModel.isLoading{
                    ProgressView()
                        .padding()
                }else{
                    List(viewModel.characters, id: \.id) { character in
                        NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
                            CharacterRowView(character: character)
                        }
                    }
                    
                }
                
            }
            
            .navigationBarTitle("Characters")
            .padding(.top)
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
}
struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CharacterListViewModel()
        return CharacterListView(viewModel: viewModel)
    }
}

