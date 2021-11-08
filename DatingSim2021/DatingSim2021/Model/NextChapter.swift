//
//  NextChapter.swift
//  DatingSim2021
//
//  Created by Jacqueline Palevich on 11/7/21.
//

import Foundation
struct NextChapter : Codable {
    var seanMin : Int
    var aspenMin: Int
    var evanMin: Int
    var nextChapterName : String
}

typealias NextChapters = [NextChapter]
typealias NextChapterMap = [String: NextChapters]
