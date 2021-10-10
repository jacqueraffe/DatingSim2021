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
    @Binding var gameState : GameState
    @StateObject private var conversationModel : ConversationModel
    init(conversationName: String, gameState : Binding<GameState>) {
        self._gameState = gameState
        _conversationModel = StateObject(wrappedValue: ConversationModel(conversationName: conversationName))
    }
    
    //history node: keeps track of choices, add choices that are made when it's redrawn display the previous choices that have already been chosen
    var body: some View {
        //scrollable list, history nodes
        ScrollViewReader { value in
            ScrollView{
                history
                current.id("current")
            }
            .onChange(of: conversationModel.history.count) {_ in
                withAnimation {
                    value.scrollTo("current", anchor: .center)
                }
            }
            .onChange(of: conversationModel.ended) {_ in
                gameState.level += 1
            }
        }
    }
    
    @ViewBuilder
    private var history: some View{
        ForEach(conversationModel.history ){exchange in
            VStack{
                ChatBubbleOther(text: exchange.prompt)
                ChatBubbleSelf(text: exchange.choiceLabel)
            }
        }
    }
    
    @ViewBuilder
    private var current: some View{
        let node = conversationModel.currentNode
        ChatBubbleOther(text: node.prompt)
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
