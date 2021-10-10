//
//  DatingSim2021App.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 9/25/21.
//

import SwiftUI

@main
struct DatingSim2021App: App {
    
    @StateObject private var gameModel = GameModel()
    var body: some Scene {
        WindowGroup {
            ContentView(gameState : $gameModel.gameState){ gameModel.save() }
                .onAppear{
                    gameModel.load()
                }
            
        }
    }
}
