//
//  GameState.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 10/9/21.
//

import Foundation

public struct GameState : Codable, Equatable {
    //curr Chapter
    var chapter : String
    //affection points for each character
    var sean : Int
    var aspen : Int
    var evan : Int
    //visited chapters
    var visitedChapters : Set<String>
    //chapter history
    var history : [String: Conversation.History]
    var currentConversation: ConversationState
    
    var currentChapterName: String {
        chapter
    }
    
    public init() {
        chapter = "Chapter1"
        sean = 0
        aspen = 0
        evan = 0
        history = [:]
        currentConversation = ConversationState()
        visitedChapters = Set<String>()
    }
}
