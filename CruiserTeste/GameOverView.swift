//
//  GameOverView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

struct GameOverView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.gray)
            VStack( spacing: 20){
                Text("Game Over")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 40, weight: .bold))
                Circle()
                    .frame(width: 100, alignment: .center)
                    .foregroundColor(.purple)
                VStack(alignment: .leading, spacing: 30){
                    Text("Thank you for your gravity reports on earth. Here is your relatory:")
                        .font(.system(size: 22, weight: .medium))
                    HStack{
                        Text("Time traveling:")
                        Spacer()
                        Text("\(gameViewModel.secondsPlayed)s")
                    }
                    HStack{
                        Text("Gravity force:")
                        Spacer()
                        Text("10g")
                    }
                    HStack{
                        Text("Wind velocity:")
                        Spacer()
                        Text("10g")
                    }
                    Spacer()
                    Button {
                        gameViewModel.playAgain()
                        gameViewModel.showGameOver = false
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(height: 55)
                                .foregroundColor(.blue)
                            Text("Play again")
                                .foregroundColor(.white)
                        }
                    }
                    Button {
                        gameViewModel.showGameOver = false
                        gameViewModel.pauseGame()
                        gameViewModel.gameScene = .home
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(height: 55)
                                .foregroundColor(.orange)
                            Text("Main menu")
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(12)
                Spacer()
            }
        }.padding(24)
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
            .environmentObject(dev.gameVM)
    }
}
