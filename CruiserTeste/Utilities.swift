//
//  Utilities.swift
//  CruiserTeste
//
//  Created by thaxz on 23/02/23.
//

import Foundation
import SwiftUI

enum GameScenes: String {
    
    case home
    case levels
    case dialogue
    case gameScreen
    case credits
    case tutorial
}

enum GameLevels: String {
    
    case earth
    case planet
}

enum ButtonTypes: String {
    
    case primary
    case secondary
}

struct Dialogues{
    
    let earth: [String] = [
    "this is the first earth dialogue line",
    "this is the second earth dialogue line",
    "this is the third earth dialogue line",
    ]
    
    let planet: [String] = [
    "this is the first planet dialogue line",
    "this is the second planet dialogue line",
    "this is the third planet dialogue line",
    ]
    
}


