//
//  Enums.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import Foundation

public enum ApiError: Error {
    case malformedURL
    case notSaved
}

public let server = "https://gateway.marvel.com:443/v1/public/"
