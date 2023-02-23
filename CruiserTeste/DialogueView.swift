//
//  DialogueView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

struct DialogueView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            Color.red
                .ignoresSafeArea()
            VStack{
                Text("DIALOGUE VIEW")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                Button {
                    gameViewModel.viewNumber = 3
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
        DialogueView()
            .environmentObject(dev.gameVM)
    }
}
