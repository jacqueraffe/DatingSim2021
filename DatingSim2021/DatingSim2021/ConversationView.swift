//
//  ConversationView.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 9/25/21.
//

import SwiftUI

struct ConversationView: View {
    @StateObject private var conversationModel = ConversationModel(conversationName: "Chapter1")
    
    var body: some View {
        let node = conversationModel.currentNode
        Text(node.prompt)
        let choices = node.choices
        ForEach(node.choices) { choice in
            Button(choice.label){
                //find which choice the user chose
                let offset = choices.firstIndex{$0.label == choice.label}!
                conversationModel.pick(choice: offset)
            }
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
