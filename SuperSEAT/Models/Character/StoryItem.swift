//
//  StoryItem.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import Foundation

public struct StoryItem: Codable , Identifiable {
    public var id: String { return resourceURI }
    public let resourceURI: String
    public let name: String
    public let type: String
}
