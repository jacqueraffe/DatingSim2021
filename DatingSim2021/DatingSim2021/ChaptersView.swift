//
//  ChaptersView.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 10/2/21.
//

import SwiftUI

struct ChaptersView: View {
    @StateObject private var chapters = ChaptersModel(chapters: [
    "Chapter1", "Chapter2"])
    var body: some View {
        //chapter's are identified by their name
        List(chapters.chapters, id: \.self){ chapter in
            NavigationLink(destination: ConversationView(conversationName: chapter)) {
                ChapterRow(chapterName: chapter)
            }
        }
    }
}

struct ChaptersView_Previews: PreviewProvider {
    static var previews: some View {
        ChaptersView()
    }
}
