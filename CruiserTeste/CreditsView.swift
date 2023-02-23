//
//  CreditsView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

struct CreditsView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            VStack{
                Text("CREDITS VIEW")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                Button {
                    gameViewModel.gameScene = .home
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .foregroundColor(.white)
                        Text("back to menu")
                            .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.blue)
                    }
                } .padding(16)
            }
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .environmentObject(dev.gameVM)
    }
}
