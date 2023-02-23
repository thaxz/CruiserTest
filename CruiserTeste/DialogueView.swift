//
//  DialogueView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

struct DialogueView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    let level: GameLevels
    var color: Color
    var text: String
    
    init(level: GameLevels){
        self.level = level
        switch level {
        case .earth:
            self.color = .red
            self.text = "EARTH DIALOGUE"
        case .planet:
            self.color = .blue
            self.text = "PLANET DIALOGUE"
        }
    }

    
    var body: some View {
        ZStack{
            color
                .ignoresSafeArea()
            VStack{
                Text(text)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                Button {
                    gameViewModel.gameScene = .gameScreen
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .foregroundColor(.white)
                        Text("NEXT")
                            .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.red)
                    }
                } .padding(16)
            }
        }
    }
}

struct DialogueView_Previews: PreviewProvider {
    static var previews: some View {
        DialogueView(level: .earth)
        .environmentObject(dev.gameVM)
    }
}
