//
//  ConversationModel.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 9/25/21.
//

import Foundation

public class ConversationModel : ObservableObject {
    var gameModel : GameModel
    
    var currentNode : Conversation.Node? {
        conversation.nodes[gameModel.gameState.currentConversation.currentNodeTag]
    }
    
    private var conversation : Conversation
    
    // initializes the conversation model by getting data from the json of the chapter the user is on
    public init(gameModel : GameModel) {
        let conversationName = gameModel.gameState.currentChapterName
        let data = readLocalFile(forName: conversationName)!
        conversation = try! JSONDecoder().decode(Conversation.self,
                                                           from: data)
        self.gameModel = gameModel
        
    }
    
    //keep track of nodes that I've gone through
    func pick(choice : Int) {
        // go to the next node in the graph
        let currentNode = conversation.nodes[gameModel.gameState.currentConversation.currentNodeTag]!
        let destination = currentNode.choices[choice].destination
        let affectionPoint = currentNode.choices[choice].affectionPoint
        //history is an array, take curr node, add to history
        //erasing info, so good place to update history node
        gameModel.gameState.currentConversation.history.append(Conversation.Exchange(id: gameModel.gameState.currentConversation.history.count, prompt: currentNode.prompt, choiceLabel: currentNode.choices[choice].label))
        gameModel.gameState.currentConversation.currentNodeTag = destination
        if affectionPoint == 1 {
            gameModel.gameState.sean += 1
        } else if affectionPoint == 2 {
            gameModel.gameState.aspen += 1
        } else if affectionPoint == 3 {
            gameModel.gameState.evan += 1
        }
    }
}

public func readLocalFile(forName name: String) -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
    } catch {
        print(error)
    }
    
    return nil
}
