//
//  Conversation.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 9/25/21.
//

import Foundation

// graph of a single conversation with a character
struct Conversation : Codable {
    // tag is the name of a conversation node aka a chapter
    typealias Tag = String
    // a single user's choice
    struct Choice : Codable{
        //what the user will see as a choice
        var label : String
        // name of the node to go to if the user clicks this choice
        var destination : Tag
    }
    // one interaction point
    struct Node : Codable{
        // what the character(s)) will say to the user
        var prompt : String
        // what the user can choose to respond with
        var choices : [Choice]
    }
    // all the different conversation points in one conversation
    var nodes : [Tag: Node]
    // start node
    static let start : Tag = "start"
    // end node
    static let end : Tag = "end"
}

