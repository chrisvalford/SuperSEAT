//
//  CharacterListView+Observed.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import Foundation

extension CharacterListView {
    @MainActor
    class Observed: ObservableObject {
        @Published var characters: [CharacterResult] = []
        @Published var isLoading = false
        
        var characterData: Character? {
            didSet {
                characters.append(contentsOf: characterData?.data?.results ?? [])
            }
        }
        var startIndex = 0
        var pageSize = 20
        
        var count: Int { characters.count }
        
        func fetchCharacters() -> Void {
            isLoading = true
            let loader = CharacterLoader()
            Task {
                do {
                    let url = try loader.buildUrl(startIndex: startIndex, resultLimit: pageSize)
                    characterData = try await loader.loadModel(from: url)
                    startIndex += characterData?.data?.count ?? 0
                    isLoading = false
                } catch {
                    print(error)
                }
            }
        }
    }
}

struct CharacterLoader {
    var session = URLSession.shared
    
    private let apiKey = "9471d911b8a72d8fa5b1b69379ba7d2a"
    private let secret = "f90dae7a6cef0d2f00cd9392eabffc695aba2ce7"
        
    func buildUrl(startIndex: Int = 0, resultLimit: Int = 20) throws -> URL {
        let ts = UUID().uuidString
        let hash = ts.appending(secret).appending(apiKey)
        let string = "https://gateway.marvel.com:443/v1/public/characters?offset=\(startIndex)&limit=\(resultLimit)&apikey=\(apiKey)&ts=\(ts)&hash=\(hash.md5)"
        guard let url = URL(string: string) else {
            throw ApiError.malformedURL
        }
        return url
    }

    func loadModel(from url: URL) async throws -> Character {
        let (data, _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let model = try decoder.decode(Character.self, from: data)
        return model
    }
}
