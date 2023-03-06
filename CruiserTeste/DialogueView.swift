//
//  DialogueView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

// MARK: - MUDAR BOT˜AO DO NEXT

struct DialogueView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    
    let level: GameLevels
    let dialogue: [String]
    var background: String
    var location: String
    @State var dialoguePosition: Int = 0
    
    init(level: GameLevels){
        self.level = level
        switch level {
        case .earth:
            self.background = "dialogueEarthPH"
            self.location = "EARTH STATION"
            self.dialogue = Dialogues().earth
        case .planet:
            self.background = "dialogueMoonPH"
            self.location = "PLANET STATION"
            self.dialogue = Dialogues().planet
        }
    }
    
    var body: some View {
        ZStack{
            Image(background)
                .ignoresSafeArea()
            VStack(){
                Spacer()
                    .frame(height: 60)
                LocationContainer(type: gameViewModel.selectedLevel)
                Spacer()
                VStack(spacing: 24){
                    DialogueContainer(text: dialogue[dialoguePosition], type: gameViewModel.selectedLevel)
                    HStack {
                        Button {
                            gameViewModel.gameScene = .gameScreen
                            gameViewModel.setUpGame()
                            dialoguePosition = 0
                            
                        } label: { DialogueSecondaryButton(name: "skip") } .tint(.clear)
                        Spacer()
                        Button {
                            dialoguePosition += 1
                            if dialoguePosition == 3 {
                                dialoguePosition = 0
                                gameViewModel.gameScene = .gameScreen
                                gameViewModel.setUpGame()
                            }
                        } label: { DialogueSecondaryButton(name: "next") } .tint(.clear)
                    }
                    Spacer()
                        .frame(height: 20)
                } .padding(.horizontal, 16)
            }
        } .onAppear{
            gameViewModel.pauseGame()
        }
    }
}

struct DialogueSecondaryButton: View {
    let name: String
    var body: some View {
        ZStack{
            Rectangle()
                .border(.white, width: 2)
            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .bold))
        }
        .frame(width: 100 ,height: 40)
    }
}

struct DialogueView_Previews: PreviewProvider {
    static var previews: some View {
        DialogueView(level: .earth)
            .environmentObject(dev.gameVM)
    }
}
