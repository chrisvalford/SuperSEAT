//
//  CharacterEvent.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import Foundation

public struct CharacterEvent: Codable {
    public let available: Int?
    public let returned: Int?
    public let collectionURI: String?
    public var items: [EventItem] = []
}
