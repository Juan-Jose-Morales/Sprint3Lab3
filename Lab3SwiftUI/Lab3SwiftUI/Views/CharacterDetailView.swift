//
//  CharacterDetailView.swift
//  Lab3SwiftUI
//
//  Created by Juan jose Morales on 13/5/24.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @ObservedObject var viewModel: CharacterDetailViewModel
    
        var body: some View {
            ZStack {
                        background()
                        VStack(alignment: .leading) {
                            VStack {
                                characterImageView(imageURL: viewModel.character.image)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                Text(viewModel.character.name)
                                    .font(.title)
                                    .bold()
                                    .padding()
                            }
                            .background(Color.white)
                            .cornerRadius(20)
                            .padding()
                            
                            if viewModel.isLoading{
                                           Spacer()
                                           HStack{
                                               Spacer()
                                               ProgressView()
                                                   .padding()
                                               Spacer()
                                           }
                                           Spacer()
                            } else {
                                characterDetailsView()
                                    .padding()
                            }
                        }
                    }
                    .onAppear {
                        viewModel.fetchCharacterDetails()
                    }
                }
    
    func background()-> some View {
        Color.gray.opacity(0.1)
            .edgesIgnoringSafeArea(.all)
    }
    
    func characterImageView(imageURL: String) -> some View {
            if let url = URL(string: imageURL) {
                return AnyView(
                    AsyncImage(url: url)
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .clipShape(Circle())
                )
            } else {
                return AnyView(
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                )
            }
        }
    
    func characterDetailsView() -> some View {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(viewModel.characterDetails, id: \.0) { detail in
                    characterDetailRow(title: detail.0, value: detail.1)
                }
            }
        }
    
    func characterDetailRow(title: String, value: String) -> some View{
        HStack{
            Text(title)
                .fontWeight(.bold)
            Spacer()
            Text(value.isEmpty ? "Unknown" : value)
        }
    }
}


