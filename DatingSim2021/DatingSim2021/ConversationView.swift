//
//  ConversationView.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 9/25/21.
//TO DO:
//  chapters list view, can't change answers
//  write some more chapters
//  add scoring system
//

import SwiftUI

struct ConversationView: View {
    
    @StateObject private var conversationModel : ConversationModel
    init(conversationName: String) {
        _conversationModel = StateObject(wrappedValue: ConversationModel(conversationName: conversationName))
    }
    //history node: keeps track of choices, add choices that are made when it's redrawn display the previous choices that have already been chosen
    var body: some View {
        //scrollable list, history nodes
        let node = conversationModel.currentNode
        Text(node.prompt)
            .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.blue)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
        let choices = node.choices
        ForEach(node.choices) { choice in
            Button(choice.label){
                //find which choice the user chose
                let offset = choices.firstIndex{$0.label == choice.label}!
                conversationModel.pick(choice: offset)
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .font(.title)
        }
    }
}
