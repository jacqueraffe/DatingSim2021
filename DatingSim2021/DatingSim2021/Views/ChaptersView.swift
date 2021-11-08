//
//  ChaptersView.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 10/2/21.
//

import SwiftUI

struct ChaptersView: View {
    @ObservedObject
    var gameModel : GameModel
    @StateObject private var chapters = ChaptersModel(chapters: [
        "Chapter1", "Chapter2", "Chapter3", "SeanWin", "AspenWin", "EvanWin", "Lose"])
    @State private var selection: String? = nil
    var body: some View {
        VStack{
            GameStateView(gameState: gameModel.gameState)
            //chapters are identified by their name
            List(chapters.chapters, id: \.self){ chapter in
                NavigationLink(destination: chapterView(of: chapter)) {
                    ChapterRow(chapterName: chapter)
                }
            }
        }.onChange(of: gameModel.gameState.chapter){ chapter in
            selection = chapter
        }
    }
    
    @ViewBuilder
    func chapterView(of chapter : String) -> some View{
        if chapter == gameModel.gameState.chapter{
            ConversationView(conversationName: chapter, gameModel: gameModel)
        } else if gameModel.gameState.visitedChapters.contains(chapter) {
            ReView(history: gameModel.gameState.history[chapter]!)
        } else {
            Text("Not yet")
        }
    }
}
