//
//  HomeView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            Color.purple
                .ignoresSafeArea()
            VStack{
                Text("HOME VIEW")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                Button {
                   gameViewModel.viewNumber = 1
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .foregroundColor(.white)
                        Text("PLAY GAME")
                            .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.purple)
                    }
                } .padding(16)
                
                Button {
                   gameViewModel.viewNumber = 4
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .foregroundColor(.white)
                        Text("CREDITS")
                            .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.purple)
                    }
                    
                } .padding(16)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(dev.gameVM)
    }
}
