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
        @Published var favorites: [Int] = []
        
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
        
        func loadFavorites() {
            let defaults = UserDefaults.standard
            if let favs = defaults.object(forKey:"Favorites") as? [Int] {
                favorites = favs
            }
        }
        
        func updateFavorite(id: Int) {
            if let index = favorites.firstIndex(of: id) {
                favorites.remove(at: index)
                print("Removed \(id)")
            } else {
                favorites.append(id)
                print("Added \(id)")
            }
            let defaults = UserDefaults.standard
            defaults.set(favorites, forKey: "Favorites")
        }
        
        func isFavorite(id: Int) -> Bool {
            let index = favorites.firstIndex(of: id)
            return index != nil
        }
    }
}
