//
//  GameStateView.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 10/9/21.
//

import Foundation
import SwiftUI

public struct GameStateView : View {
    let gameState : GameState
    public var body : some View {
        HStack{
            Text("Chapter: \(gameState.chapter)")
            Text("Sean: \(gameState.sean)")
            Text("Evan: \(gameState.evan)")
            Text("Aspen: \(gameState.aspen)")
        }
    }
}
