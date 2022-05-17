//
//  Credentials.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 17/5/22.
//

import Foundation

public struct Credentials {
    private static let apiKey = "9471d911b8a72d8fa5b1b69379ba7d2a"
    private static let secret = "f90dae7a6cef0d2f00cd9392eabffc695aba2ce7"
    
    public static func apiValues() -> String {
        let ts = UUID().uuidString
        let hash = ts.appending(secret).appending(apiKey)
        return "&apikey=\(apiKey)&ts=\(ts)&hash=\(hash.md5)"
    }
}
