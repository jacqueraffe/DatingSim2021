//
//  ReView.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 10/16/21.
//

import Foundation

import SwiftUI

struct ReView: View {
    let history: Conversation.History

    var body: some View {
        ScrollView{
            historyView
        }
    }
    
    @ViewBuilder
    private var historyView: some View{
        ForEach(history ){exchange in
            VStack{
                ChatBubbleOther(text: exchange.prompt)
                ChatBubbleSelf(text: exchange.choiceLabel)
            }
        }
    }
    
    
}
