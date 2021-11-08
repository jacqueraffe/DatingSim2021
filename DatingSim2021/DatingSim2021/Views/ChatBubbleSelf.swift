//
//  ChatBubbleSelf.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 10/4/21.
//

import SwiftUI

struct ChatBubbleSelf: View {
    var text : String
    var body: some View {
        Text(text)
            .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.gray)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
    }
}
