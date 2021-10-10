//
//  ConversationModel.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 9/25/21.
//

import Foundation

class ConversationModel : ObservableObject {
    @Published
    var currentNode : Conversation.Node
    
    @Published
    var history : Conversation.History
    
    @Published
    var ended : Bool
    
    private var conversation : Conversation
    
    // initializes the conversation model by getting data from the json of the chapter the user is on
    public init(conversationName : String) {
        let data = readLocalFile(forName: conversationName)!
        conversation = try! JSONDecoder().decode(Conversation.self,
                                                           from: data)
        currentNode = conversation.nodes[Conversation.start]!
        history = []
        ended = false
    }
    
    //keep track of nodes that I've gone through
    func pick(choice : Int) {
        // go to the next node in the graph
        let destination = currentNode.choices[choice].destination
        //history is an array, take curr node, add to history
        //erasing info, so good place to update history node
        history.append(Conversation.Exchange(id: history.count, prompt: currentNode.prompt, choiceLabel: currentNode.choices[choice].label))
        if destination == Conversation.end {
            ended = true
        } else {
            currentNode = conversation.nodes[destination]!
        }
    }
}

private func readLocalFile(forName name: String) -> Data? {
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
