//
//  CharacterLoader.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 17/5/22.
//

import Foundation

public struct CharacterLoader {
    private var session = URLSession.shared
        
    public func buildUrl(startIndex: Int = 0, resultLimit: Int = 20) throws -> URL {
        let string = "\(server)characters?offset=\(startIndex)&limit=\(resultLimit)\(Credentials.apiValues())"
        guard let url = URL(string: string) else {
            throw ApiError.malformedURL
        }
        return url
    }

    public func loadModel(from url: URL) async throws -> Character {
        let (data, _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let model = try decoder.decode(Character.self, from: data)
        return model
    }
}
