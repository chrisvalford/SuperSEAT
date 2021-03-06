//
//  CharacterResult.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import Foundation

public struct CharacterResult: Codable, Identifiable {
    public let id: UUID
    public var isFavorite: Bool
    public let marvelId: Int
    public let name: String?
    public let description: String?
    public let modified: Date?
    public let resourceURI: String?
    public var urls: [ResultUrl] = []
    public let thumbnail: Thumbnail?
    public let comics: CharacterComics?
    public let stories: CharacterStories?
    public let events: CharacterEvent?
    public let series: CharacterSeries?
    
    enum CodingKeys: String, CodingKey {
        case marvelId = "id"
        case name
        case description
        case modified
        case resourceURI
        case urls
        case thumbnail
        case comics
        case stories
        case events
        case series
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        isFavorite = false
        marvelId = try container.decode(Int.self, forKey: .marvelId)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        modified = try container.decode(Date.self, forKey: .modified)
        resourceURI = try container.decode(String.self, forKey: .resourceURI)
        urls = try container.decodeIfPresent([ResultUrl].self, forKey: .urls) ?? []
        thumbnail = try container.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
        comics = try container.decodeIfPresent(CharacterComics.self, forKey: .comics)
        stories = try container.decodeIfPresent(CharacterStories.self, forKey: .stories)
        events = try container.decodeIfPresent(CharacterEvent.self, forKey: .events)
        series = try container.decodeIfPresent(CharacterSeries.self, forKey: .series)
    }
    
    public mutating func toggleFavorite() {
        self.isFavorite.toggle()
    }
}

extension CharacterResult: Equatable {
    public static func == (lhs: CharacterResult, rhs: CharacterResult) -> Bool {
        return lhs.id == rhs.id
    }
}

extension CharacterResult: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
