//
//  GameState.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 10/9/21.
//

import Foundation

public struct GameState : Codable {
    //levels completed
    var level : Int
    //affection points for each character
    var sean : Int
    var aspen : Int
    var evan : Int
    
    public init() {
        level = 0
        sean = 0
        aspen = 0
        evan = 0
    }
    
    mutating func nextLevel() {
        level += 1
    }
}
