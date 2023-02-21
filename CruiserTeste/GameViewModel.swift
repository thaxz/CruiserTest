//
//  GameViewModel.swift
//  CruiserTeste
//
//  Created by thaxz on 16/02/23.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    
    var characterSprint: [String] = []

    init() {
        for i in 1...8 {
            let imageNames = "attack_0\(i)"
            characterSprint.append(imageNames)
        }
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
