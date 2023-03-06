//
//  ColorExtension.swift
//  CruiserTeste
//
//  Created by thaxz on 26/02/23.
//

import Foundation
import SwiftUI

extension Color {
    // toda vez que acessar "Color", conseguiremos acessar as cores que cadastramos
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    let mediumPurple = Color("mediumPurple")
    let darkerPurple = Color("darkerPurple")
    let mediumBlue = Color("mediumBlue")
    let darkerBlue = Color("darkerBlue")
    
}
