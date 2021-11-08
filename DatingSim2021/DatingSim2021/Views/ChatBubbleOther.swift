//
//  ChatBubble.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 10/2/21.
//

import SwiftUI

struct ChatBubbleOther: View {
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

private func getLeftBubblePath(in rect: CGRect) -> Path{
    let width = rect.width
    let height = rect.height
    let path = Path { p in
        p.move(to: CGPoint(x: 25, y:height))
        p.addLine(to: CGPoint(x: width - 20, y: height))
        p.addCurve(to: CGPoint(x: width, y: height-20),
                   control1: CGPoint(x: width - 8, y: height),
                   control2: CGPoint(x: width, y: height - 8))
        p.addLine(to: CGPoint(x: width, y: 20))
        p.addCurve(to: CGPoint(x: width - 20, y: 0),
                   control1: CGPoint(x: width, y: 8),
                   control2: CGPoint(x: width - 8, y: 0))
        p.addLine(to: CGPoint(x: 21, y: 0))
        p.addCurve(to: CGPoint(x: 4, y: 20),
                   control1: CGPoint(x: 12, y: 0),
                   control2: CGPoint(x: 4, y: 8))
        p.addLine(to: CGPoint(x: 4, y: height - 11))
        p.addCurve(to: CGPoint(x: 0, y: height),
                   control1: CGPoint(x: 4, y: height - 1),
                   control2: CGPoint(x: 0, y: height))
        p.addLine(to: CGPoint(x: -0.05, y: height - 0.01))
        p.addCurve(to: CGPoint(x: 11.0, y: height -  4.0),
                   control1: CGPoint(x: 4.0, y: height + 0.5),
                   control2: CGPoint(x: 8, y: height - 1))
        p.addCurve(to: CGPoint(x: 25, y: height),
                   control1: CGPoint(x: 16, y: height),
                   control2: CGPoint(x: 20, y: height))
        
    }
    return path
}
