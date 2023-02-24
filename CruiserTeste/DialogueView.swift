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
    let dialogue: [String]
    var backgroundImage: Color
    var levelName: String
    @State var dialoguePosition: Int = 0
    
    init(level: GameLevels){
        self.level = level
        switch level {
        case .earth:
            self.backgroundImage = .red
            self.levelName = "EARTH STATION"
            self.dialogue = Dialogues().earth
        case .planet:
            self.backgroundImage = .blue
            self.levelName = "PLANET STATIOM"
            self.dialogue = Dialogues().planet
        }
    }
    
    var body: some View {
        ZStack{
            backgroundImage
                .ignoresSafeArea()
            VStack(){
                Spacer()
                    .frame(height: 60)
                HStack {
                    Text(levelName)
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 55)
                        .background(.gray)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                        .frame(width: 60)
                }
                Spacer()
                VStack(alignment: .trailing){
                    ZStack(alignment: .topLeading){
                        Rectangle()
                            .foregroundColor(.gray)
                        Text(dialogue[dialoguePosition])
                            .foregroundColor(.white)
                            .padding(16)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 160, alignment: .topLeading)
                    
                    HStack {
                        Button {
                            gameViewModel.gameScene = .gameScreen
                            gameViewModel.setUpGame()
                            dialoguePosition = 0
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 80,height: 40)
                                    .foregroundColor(.gray)
                                Text("SKIP")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                        Button {
                            dialoguePosition += 1
                            if dialoguePosition == 3 {
                                dialoguePosition = 0
                                    gameViewModel.gameScene = .gameScreen
                                    gameViewModel.setUpGame()
                            }
                        } label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 80,height: 40)
                                    .foregroundColor(.gray)
                                Text("NEXT")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        }
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
