//
//  CharacterRowView.swift
//  Lab3SwiftUI
//
//  Created by Juan jose Morales on 13/5/24.
//

import SwiftUI

struct CharacterRowView: View {
    var character: Character
    @State private var image: UIImage? = nil
    @State private var isLoading: Bool = false
    var body: some View {
        
        HStack{
            characterImageView()
            characterNameView()
        }
        .padding(.vertical, 5)
        .onAppear {
            loadImage()
        }
    }
    private func loadImage(){
        guard let url = URL(string: character.image) else { return }
                
                isLoading = true
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, let loadedImage = UIImage(data: data) else {
                        isLoading = false
                        return
                    }
                    
                    DispatchQueue.main.async {
                        isLoading = false
                        image = loadedImage
                    }
                }.resume()
    }
    
   private func characterImageView() -> some View {
        Group{
            if let loadedImage = image {
                Image(uiImage: loadedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.leading, 5)
                    
            } else if isLoading {
                ProgressView()
                    .frame(width: 50, height: 50)
                    .padding(.leading, 5)
            } else{
                Image(systemName: "questionmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .scaledToFit()
                    .padding(.leading, 5)
            }
           }
        }
    
    func characterNameView() -> some View {
        Text(character.name)
            .font(.headline)
            .padding(.leading, 10)
    }
}

