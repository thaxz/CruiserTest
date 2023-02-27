//
//  GameView.swift
//  CruiserTeste
//
//  Created by thaxz on 16/02/23.
//

import SwiftUI

struct GameView: View {
    
    let images = (0...7).map { UIImage(named: "attack_0\($0)")!}
    var backgroundImage: String
    var groundImage: String
    
    @EnvironmentObject var gameViewModel: GameViewModel
    let level: GameLevels
    
    init(level: GameLevels){
        self.level = level
        switch level {
        case .earth:
            self.backgroundImage = "earthSkyPH"
            self.groundImage = "earthGroundPH"
        case .planet:
            self.backgroundImage = "moonSkyPH"
            self.groundImage = "moonGroundPH"
        }
    }
    
    var body: some View {
        ZStack {
            Color.theme.darkerPurple
            Image(backgroundImage)
                .ignoresSafeArea()
                    ZStack(){
                        VStack {
                            Spacer()
                            Image(groundImage)
                                .resizable()
                                .frame(height: 610)
                                .transformEffect(
                                    withAnimation(.spring()){
                                        gameViewModel.planetRotation
                                    }
                            )
                        }
                        VStack{
                            Spacer()
                            Image(uiImage: images[gameViewModel.index])
                                .resizable()
                                .frame(width: 100, height: 200)
                                .transformEffect(gameViewModel.playerRotation)
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                    }
            
            if gameViewModel.showGameOver {
                GameOverView()
            }
        } 
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(level: .earth)
            .environmentObject(dev.gameVM)
    }
}
