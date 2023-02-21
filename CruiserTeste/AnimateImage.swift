//
//  AnimateImage.swift
//  CruiserTeste
//
//  Created by thaxz on 21/02/23.
//

import Foundation
import SwiftUI

struct AnimateImage: View {
    
    // MARK: COMENTAR COMO FUNCIONA ISSO AQUI
    
    @State private var image: Image?
    let imageNames: [String]
    
    var body: some View {
        Group {
            image?
                .resizable()
                .scaledToFit()
        }.onAppear(perform: {
            self.animate()
        })
    }
    
    private func animate() {
        var imageIndex: Int = 0
        Timer.scheduledTimer(withTimeInterval: 0.025, repeats: true) { timer in
            if imageIndex < self.imageNames.count {
                self.image = Image(self.imageNames[imageIndex])
                imageIndex += 1
            } else {
                timer.invalidate()
            }
        }
    }
}
