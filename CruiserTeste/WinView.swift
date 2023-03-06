//
//  WinView.swift
//  CruiserTeste
//
//  Created by thaxz on 27/02/23.
//

import SwiftUI

struct WinView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.theme.darkerPurple)
                .border(.white, width: 3)
            VStack(spacing: 20){
                Spacer()
                Text("MISSION COMPLETED")
                    .font(.system(size: 40, weight: .black))
                    .foregroundColor(.white)
                
                Text("You collected every information your crew needeed!")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
                
                Image("winPH")
                
                VStack(spacing: 10){
                    CollectedInfo(text: "Gravity force:", info: "10")
                    CollectedInfo(text: "Gravity force:", info: "10")
                    CollectedInfo(text: "Gravity force:", info: "10")
                    CollectedInfo(text: "Gravity force:", info: "10")
                }
                Spacer()
                
                Button {
                    gameViewModel.playAgain()
                    gameViewModel.showGameOver = false
                    gameViewModel.showWin = false
                } label: { PrimaryButton(name: "Next Level", type: .earth) }
                
                Button {
                    gameViewModel.showGameOver = false
                    gameViewModel.pauseGame()
                    gameViewModel.gameScene = .home
                } label: { SecondaryButton(name: "Main Menu") } .tint(.clear)
                Spacer()
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .padding(.horizontal ,8)
        .padding(.vertical, 30)
    }
}

struct CollectedInfo: View{
    let text: String
    let info: String
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Spacer()
            Text(info)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
            WinView()
                .environmentObject(dev.gameVM)
        }
    }
}
