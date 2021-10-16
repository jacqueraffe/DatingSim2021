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
        "Chapter1", "Chapter2"])
    @State private var selection: String? = nil
    var body: some View {
        VStack{
            GameStateView(gameState: gameModel.gameState)
            //chapters are identified by their name
            //TODO: prevent people from getting to unplayed chapter
            List(Array(chapters.chapters.enumerated()), id: \.1){ level, chapter in
                NavigationLink(destination: chapterView(of: level)) {
                    ChapterRow(chapterName: chapter)
                }
            }
        }.onChange(of: gameModel.gameState.level){ newLevel in
            selection = chapters.chapters[newLevel]
        }
    }
    
    @ViewBuilder
    func chapterView(of level : Int) -> some View{
        if level < gameModel.gameState.level {
            ReView(history: gameModel.gameState.history[level])
        } else if level == gameModel.gameState.level{
            let chapter = chapters.chapters[level]
            ConversationView(conversationName: chapter, gameModel: gameModel)
        } else {
            Text("Not yet")
        }
    }
}
