//
//  ChatBubble.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 10/2/21.
//

import SwiftUI

struct ChatBubble: View {
    var text : String
    var body: some View {
        Text(text)
            .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.blue)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
    }
}
