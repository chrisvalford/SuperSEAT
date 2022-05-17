//
//  ResultUrl.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import Foundation

public struct ResultUrl: Codable, Identifiable {
    public var id: String { url }
    public let type: String
    public let url: String
}
