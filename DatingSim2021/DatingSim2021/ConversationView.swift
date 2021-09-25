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
        Text(conversationModel.currentNode.prompt)
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
