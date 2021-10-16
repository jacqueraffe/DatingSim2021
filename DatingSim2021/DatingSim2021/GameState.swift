//
//  GameState.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 10/9/21.
//

import Foundation

public struct GameState : Codable, Equatable {
    //levels completed
    var level : Int
    //affection points for each character
    var sean : Int
    var aspen : Int
    var evan : Int
    
    //chapter history
    var history: [Conversation.History]
    var currentConversation: ConversationState
    
    var currentChapterName: String {
        "Chapter\(level+1)"
    }
    
    public init() {
        level = 0
        sean = 0
        aspen = 0
        evan = 0
        history = []
        currentConversation = ConversationState()
    }
    
    mutating func nextLevel() {
        history.append(currentConversation.history)
        currentConversation = ConversationState()
        level += 1
    }
}
