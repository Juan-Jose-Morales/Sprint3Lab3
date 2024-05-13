//
//  SplashView.swift
//  Lab3SwiftUI
//
//  Created by Juan jose Morales on 8/5/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isAnimating = false
    @State private var isActive = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .padding()
                    
                    Spacer()
                    
                    Image("RickMorty")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .scaleEffect(isAnimating ? 1.2 : 1.0)
                        .padding()
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                        .onAppear{
                            
                            self.isAnimating = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                
                                self.isActive = true
                            }
                            
                        }
                    Spacer()
                }
            }
            
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $isActive){
                CharacterListView(viewModel: CharacterListViewModel())
            }
        }
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
