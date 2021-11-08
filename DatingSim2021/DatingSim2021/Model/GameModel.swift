//
//  GameModel.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 10/9/21.
//

import Foundation

public class GameModel : ObservableObject {
    
    
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                                  in: .userDomainMask,
                                                  appropriateFor: nil,
                                                  create: false)
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
    
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("game.data")
    }
    
    @Published
    public var gameState : GameState
    
    @Published
    public var conversationModel : ConversationModel?
    
    @Published var chapterMap : NextChapterMap
    
    public init (){
        gameState = GameState()
        conversationModel = nil
        
        let data = readLocalFile(forName: "ChapterMap")!
        chapterMap = try! JSONDecoder().decode(NextChapterMap.self, from: data)
    }
    
    func load() {
        guard let data = try? Data(contentsOf: Self.fileURL) else {
            return
        }
        guard let gameState = try? JSONDecoder().decode(GameState.self, from: data) else {
            fatalError("Can't decode saved game data.")
        }
        self.gameState = gameState
                conversationModel = ConversationModel(gameModel: self)
    }
    
    func save() {
        let gameState = self.gameState
        DispatchQueue.global(qos: .background).async {
            guard let data = try? JSONEncoder().encode(gameState) else { fatalError("Error encoding data") }
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
    
    public func goToNextChapter(){
        gameState.visitedChapters.insert(gameState.chapter)
        gameState.history[gameState.chapter] = gameState.currentConversation.history
        let nextChapters = chapterMap[gameState.chapter]!
        for nextChapter in nextChapters {
            if gameState.sean >= nextChapter.seanMin &&
                gameState.aspen >= nextChapter.aspenMin &&
                gameState.evan >= nextChapter.evanMin {
                gameState.chapter = nextChapter.nextChapterName
                gameState.currentConversation = ConversationState()
                return
            }
        }
    }
    
}
