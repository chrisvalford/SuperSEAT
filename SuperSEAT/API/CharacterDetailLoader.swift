//
//  CharacterDetailLoader.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 17/5/22.
//

import Foundation

public struct CharacterDetailLoader {
    private var session = URLSession.shared
    
    public func buildUrl(characterId: Int) throws -> URL {
        let string = "\(server)characters/\(characterId)?\(Credentials.apiValues())"
        guard let url = URL(string: string) else {
            throw ApiError.malformedURL
        }
        return url
    }
        
    public func buildWebUrl(url: String) throws -> URL {
        //let string = "\(url)\(Credentials.apiValues())"
        guard let url = URL(string: url) else {
            throw ApiError.malformedURL
        }
        return url
    }

    public func loadModel(from url: URL) async throws -> Character {
        let (data, _) = try await session.data(from: url)
        //let str = String(data: data, encoding: .utf8)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let model = try decoder.decode(Character.self, from: data)
        return model
    }
}
