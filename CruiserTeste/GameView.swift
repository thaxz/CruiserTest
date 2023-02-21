//
//  GameView.swift
//  CruiserTeste
//
//  Created by thaxz on 16/02/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack {
            Color.blue.opacity(0.5)
                .ignoresSafeArea()
            VStack(spacing: 100){
                Spacer()
                Rectangle()
                    .frame(width: 200, height: 300)
                    .foregroundColor(.purple.opacity(0.8))
                AnimateImage(imageNames: gameViewModel.characterSprint)
                   // .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                   // .foregroundColor(.green.opacity(0.5))
            }.ignoresSafeArea()
        }
        .onAppear{
            
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(dev.gameVM)
    }
}
