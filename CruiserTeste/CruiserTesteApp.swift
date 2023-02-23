//
//  CruiserTesteApp.swift
//  CruiserTeste
//
//  Created by thaxz on 15/02/23.
//

import SwiftUI

@main
struct CruiserTesteApp: App {
    @StateObject private var gameViewModel = GameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameViewModel)
        }
    }
}

