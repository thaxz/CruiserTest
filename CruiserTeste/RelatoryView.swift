//
//  RelatoryView.swift
//  CruiserTeste
//
//  Created by thaxz on 12/03/23.
//

import SwiftUI

struct RelatoryView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    let level: GameLevels
    
    let title: String
    let image: String
    let aboutText: String
    let surfaceText: String
    
    init(level: GameLevels){
        self.level = level
        switch level {
        case .earth:
            self.title = "EARTH RELATORY"
            self.image = "earthPH"
            self.aboutText = "TEXTO DA TERRA VAI VIR AQUI"
            self.surfaceText = "TEXTO DA SUPERFICIE TERRA VAI VIR AQUI EEEEEEEEEEEEEEEEEEEEEE"
        case .planet:
            self.title = "MOON RELATORY"
            self.image = "moonPH"
            self.aboutText = "TEXTO DA SUPERFICIE LUA VAI VIR AQUI EEEEEEEEEEEEEEEEE"
            self.surfaceText = "TEXTO DA LUA VAI VIR AQUI"
        }
    }
    
    var body: some View {
        ZStack {
            Color.theme.darkerPurple
                .ignoresSafeArea()
            VStack(spacing: 30){
                Text(title)
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)
                
                Image(image)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20){
                        RelatorySection(title: "About", textBody: aboutText)
                        
                        RelatorySection(title: "Surface", textBody: surfaceText)
                        
                        Text("Characteristics")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                        
                        VStack(spacing: 10){
                            CollectedInfo(text: "Diameter:", info: "10")
                            CollectedInfo(text: "Shape:", info: "10")
                            CollectedInfo(text: "Prominent Material:", info: "10")
                            CollectedInfo(text: "Gravitational Acceleration:", info: "10")
                            CollectedInfo(text: "Orbital Distance:", info: "10")
                        }
                    }
                }
                    
                Button {
                    gameViewModel.gameScene = .home
                } label: { PrimaryButton(name: "Main Menu", type: .earth) }
                Spacer()

            }
            .padding(20)
        }
    }
}

struct RelatorySection: View {
    let title: String
    let textBody: String
    var body: some View {
        VStack(spacing: 20){
            Text(title)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
            Text(textBody)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
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

struct RelatoryView_Previews: PreviewProvider {
    static var previews: some View {
        RelatoryView(level: .earth)
            .environmentObject(dev.gameVM)
    }
}
