//
//  GameViewModel.swift
//  CruiserTeste
//
//  Created by thaxz on 16/02/23.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    
    var publisher : Timer?
    @Published var index = 0
    
    func startTimer() {
            index = 0
            publisher = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true, block: {_ in
                if self.index < 7 {
                    self.index += 1
                    print(self.index)
                } else if let timer = self.publisher {
                    self.index = 0
                    //timer.invalidate()
                }
            })
      }
    
    func setUpGame(){
        
    }
    
    func startGame(){
        
    }
    
    func rotateWorld(){
        
    }
    
    func checkGameOver(){
        
    }
    
    func playAgain(){
        
    }
    
}
