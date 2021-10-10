//
//  ContentView.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 9/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var gameState : GameState
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: () -> Void
    
    var body: some View {
        NavigationView{
            ChaptersView(gameState : $gameState)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}
