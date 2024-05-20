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
                background()
                VStack{
                    logoView()
                    Spacer()
                    animatedImage()
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $isActive){
                CharacterListView(viewModel: CharacterListViewModel())
            }
        }
    }
    private func background() -> some View {
        Image("background")
            .resizable()
            .edgesIgnoringSafeArea(.all)
    }
    
    private func logoView() -> some View {
        Image("Logo")
            .resizable()
            .applyImageModifiers(width: 300, height: 300)
    }
    
    private func animatedImage()-> some View{
        Image("RickMorty")
            .resizable()
            .applyImageModifiers(width: 300, height: 300)
            .scaleEffect(isAnimating ? 1.2 : 1.0)
            .padding()
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                    self.isAnimating = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isActive = true
                }
            }
    }
}
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
