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
