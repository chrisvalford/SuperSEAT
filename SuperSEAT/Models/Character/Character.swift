//
//  Character.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import Foundation

public struct Character: Codable {
    public let code: Int?
    public let status: String?
    public let copyright: String?
    public let attributionText: String?
    public let attributionHTML: String?
    public let data: CharacterData
    public let etag: String?
}

