//
//  ConversationView.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 9/25/21.
//

import SwiftUI

struct ConversationView: View {
    
    @StateObject private var conversationModel = ConversationModel(conversationName: "Chapter2")
    
    var body: some View {
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

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
