//
//  GameView.swift
//  CruiserTeste
//
//  Created by thaxz on 16/02/23.
//

import SwiftUI

struct GameView: View {
    
    let images = (0...7).map { UIImage(named: "attack_0\($0)")!}
    
    @EnvironmentObject var gameViewModel: GameViewModel
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.5)
                .ignoresSafeArea()
            VStack(spacing: 100){
                Spacer()
                Image(uiImage: images[gameViewModel.index])
                    .resizable()
                    .frame(width: 200, height: 300)
                    .rotationEffect(gameViewModel.playerRotation)
                Image("street")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                    .rotationEffect(gameViewModel.planetRotation, anchor: .center)
            }
            //.ignoresSafeArea()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(dev.gameVM)
    }
}
