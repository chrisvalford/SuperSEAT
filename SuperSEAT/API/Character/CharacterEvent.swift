//
//  CharacterEvent.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import Foundation

public struct CharacterEvent: Codable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [EventItem?]
}
