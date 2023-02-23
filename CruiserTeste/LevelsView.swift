//
//  LevelsView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

struct LevelsView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            Color.green
                .ignoresSafeArea()
            VStack{
                Text("LEVELS VIEW")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                HStack(spacing: 25) {
                    Button {
                        gameViewModel.selectedLevel = .earth
                        gameViewModel.gameScene = .dialogue
                        gameViewModel.playAgain()
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 55 ,height: 55)
                                .foregroundColor(.white)
                            Text("1")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.blue)
                        }
                    }
                    Button {
                        gameViewModel.selectedLevel = .planet
                        gameViewModel.gameScene = .dialogue
                        gameViewModel.playAgain()
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 55 ,height: 55)
                                .foregroundColor(.white)
                            Text("2")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
    }
}

struct LevelsView_Previews: PreviewProvider {
    static var previews: some View {
        LevelsView()
            .environmentObject(dev.gameVM)
    }
}
