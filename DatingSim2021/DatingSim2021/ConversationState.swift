//
//  ConversationState.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 10/16/21.
//

import Foundation

public struct ConversationState : Codable, Equatable {
    
    var currentNodeTag : Conversation.Tag
    var history : Conversation.History
    
    var ended : Bool{
        currentNodeTag == "end"
    }
    
    init() {
        currentNodeTag = "start"
        history = []
    }
}
