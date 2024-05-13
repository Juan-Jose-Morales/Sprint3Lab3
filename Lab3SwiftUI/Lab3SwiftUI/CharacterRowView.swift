//
//  CharacterRowView.swift
//  Lab3SwiftUI
//
//  Created by Juan jose Morales on 13/5/24.
//

import SwiftUI

struct CharacterRowView: View {
    var character: Character
    var body: some View {
        
        HStack{
            
            if let imageURL = URL(string: character.image){
                AsyncImage(url: imageURL)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .scaledToFit()
            } else{
                Image(systemName: "questionmark")
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .scaledToFit()
            }
            
            Text(character.name)
                .font(.headline)
                .padding(.leading, 10)
        }
        .padding(.vertical, 5)
        
    }
}


