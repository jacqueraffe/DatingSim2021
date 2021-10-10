//
//  ChaptersView.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 10/2/21.
//

import SwiftUI

struct ChaptersView: View {
    @Binding var gameState : GameState
    @StateObject private var chapters = ChaptersModel(chapters: [
        "Chapter1", "Chapter2"])
    var body: some View {
        VStack{
            GameStateView(gameState: gameState)
            //chapter's are identified by their name
            List(chapters.chapters.prefix(gameState.level+1), id: \.self){ chapter in
                NavigationLink(destination: ConversationView(conversationName: chapter)) {
                    ChapterRow(chapterName: chapter)
                }
            }
        }
    }
}
