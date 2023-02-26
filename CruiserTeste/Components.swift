//
//  Components.swift
//  CruiserTeste
//
//  Created by thaxz on 26/02/23.
//

import Foundation
import SwiftUI

struct PrimaryButton: View {
    let name: String
    let type: GameLevels
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(type == .earth ? Color.theme.mediumPurple : Color.theme.mediumBlue)
                .border(.white, width: 2)
            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 22, weight: .bold))
        }
        .frame(height: 50)
    }
}

struct SecondaryButton: View {
    let name: String
    var body: some View {
        ZStack{
            Rectangle()
                .border(.white, width: 2)
            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 22, weight: .bold))
        }
        .frame(height: 50)
    }
}

struct DialogueContainer: View {
    var text: String
    let type: GameLevels
    var body: some View {
        ZStack(alignment: .topLeading){
            Rectangle()
                .foregroundColor(type == .earth ? Color.theme.mediumPurple : Color.theme.mediumBlue)
                .opacity(0.80)
                .border(.white, width: 3)
            Text(text)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .padding(16)
        }
        .frame(height: 140)
    }
}

struct LevelContainer: View {
    let type: GameLevels
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150,height: 150)
                    .foregroundColor(Color.theme.darkerGray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.white, lineWidth: 2)
                    )
                Image(type == .earth ? "earthPH" : "moonPH")
                    .resizable()
                    .frame(width: 110, height: 110)
                    .scaledToFit()
            }
            Text(type == .earth ? "Earth" : "Moon")
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .medium))
        }
    }
}

struct TutorialContainer: View {
    let type: Int
    var body: some View {
        ZStack(alignment: type == 0 ? .bottomLeading : .bottom){
            ZStack(alignment: .bottomTrailing){
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150,height: 150)
                    .foregroundColor(Color.theme.darkerPurple)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.white, lineWidth: 2)
                )
                Image(type == 0 ? "xmarkPH" : "checkmarkPH")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .offset(x: 15, y: 15)
            }
                Image(type == 0 ? "wrongSpaceshipPH" : "rightSpaceshipPH")
                    .resizable()
                    .frame(width: 110, height: 110)
                    .scaledToFit()
        }
    }
}


struct ComponentsTest_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack {
                PrimaryButton(name: "Primary", type: .earth)
                SecondaryButton(name: "Secondary")
                DialogueContainer(text: "Testing dialogue", type: .planet)
                HStack{
                    LevelContainer(type: .earth)
                    TutorialContainer(type: 1)
                }
            }
        }
    }
}
