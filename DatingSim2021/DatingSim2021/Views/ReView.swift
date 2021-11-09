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
                ForEach(exchange.prompt, id: \.self ){truck in
                ChatBubbleOther(text: truck)
                }
                ChatBubbleSelf(text: exchange.choiceLabel)
            }
        }
    }
    
    
}
