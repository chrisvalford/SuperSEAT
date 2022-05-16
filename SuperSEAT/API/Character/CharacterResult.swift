//
//  CharacterResult.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import Foundation

public struct CharacterResult: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let modified: Date?
    let resourceURI: String?
    let urls: [ResultUrl?]
    let thumbnail: Thumbnail?
    let comics: CharacterComics?
    let stories: CharacterStories?
    let events: CharacterEvent?
    let series: CharacterSeries?
}
