//
//  TutorialView.swift
//  CruiserTeste
//
//  Created by thaxz on 23/02/23.
//

import SwiftUI

struct TutorialView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack{
                Text("TUTORIAL VIEW")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
                Button {
                    gameViewModel.gameScene = .home
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .foregroundColor(.black)
                        Text("back to menu")
                            .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    }
                } .padding(16)
            }
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
            .environmentObject(GameViewModel())
    }
}
