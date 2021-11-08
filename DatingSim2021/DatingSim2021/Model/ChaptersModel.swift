//
//  ChapterModel.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 10/2/21.
//

import Foundation
public class ChaptersModel: ObservableObject {
    @Published // when this value changes a notifcation will be sent to all observers automatically
    var currentChapter : String?
    
    @Published var chapterMap : NextChapterMap
    
    var chapters: [String]
    
    init(chapters: [String]) {
        self.chapters = chapters
        currentChapter = chapters.first
        
        let data = readLocalFile(forName: "ChapterMap")!
        chapterMap = try! JSONDecoder().decode(NextChapterMap.self, from: data)
    }
    
    public var currentChapterIndex : Int? {
        get{
            if let currentChapter = currentChapter {
                return chapters.firstIndex(of: currentChapter)
            } else {
                return nil
            }
        }
        set {
            if let newValue = newValue{
                currentChapter = chapters[newValue]
            } else {
                currentChapter = nil
            }
        }
    }
    
}
