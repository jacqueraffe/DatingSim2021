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
    @State private var selection: String? = nil
    var body: some View {
        VStack{
            GameStateView(gameState: gameState)
            //chapter's are identified by their name
            //TODO: prevent people from getting to unplayed chapter
            List(chapters.chapters, id: \.self){ chapter in
                NavigationLink(destination: ConversationView(conversationName: chapter, gameState: $gameState),
                               tag: chapter, selection:$selection) {
                    ChapterRow(chapterName: chapter)
                }
            }
        }.onChange(of: gameState.level){ newLevel in
            selection = chapters.chapters[newLevel]
        }
    }
}
