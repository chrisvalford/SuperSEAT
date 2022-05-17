//
//  CharacterSeries.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import Foundation

public struct CharacterSeries: Codable {
    public let available: Int?
    public let returned: Int?
    public let collectionURI: String?
    public let items: [SeriesItem?]
}
