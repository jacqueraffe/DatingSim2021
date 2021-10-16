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
    
    public init (){
        gameState = GameState()
        conversationModel = nil
    }
    
    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                return
            }
            guard let gameState = try? JSONDecoder().decode(GameState.self, from: data) else {
                fatalError("Can't decode saved game data.")
            }
            DispatchQueue.main.async {
                self?.gameState = gameState
                self?.conversationModel = ConversationModel(gameModel: self!)
            }
        }
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
    
}
