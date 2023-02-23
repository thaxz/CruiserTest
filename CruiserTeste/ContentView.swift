//
//  ContentView.swift
//  CruiserTeste
//
//  Created by thaxz on 15/02/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        if gameViewModel.viewNumber == 0 {
            HomeView()
                .environmentObject(gameViewModel)
        } else if gameViewModel.viewNumber == 1 {
            LevelsView()
                .environmentObject(gameViewModel)
        } else if gameViewModel.viewNumber == 2 {
            DialogueView()
                .environmentObject(gameViewModel)
        } else if gameViewModel.viewNumber == 3 {
            GameView()
                .environmentObject(gameViewModel)
        } else if gameViewModel.viewNumber == 4 {
            CreditsView()
                .environmentObject(gameViewModel)
        } else {
            ZStack{
                Color.gray
                    .ignoresSafeArea()
                Text("ERROR")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(dev.gameVM)
    }
}
