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
        var favorites: [Int] = []
        
        var characterData: Character! {
            didSet {
                // Apply isFavorite
                var newCharacters = characterData.data.results
                for i in 0..<newCharacters.count {
                    if isFavorite(id: newCharacters[i].marvelId) {
                        newCharacters[i].toggleFavorite()
                    }
                }
                characters.append(contentsOf: newCharacters)
            }
        }
        var startIndex = 0
        var pageSize = 20
        
        var count: Int { characters.count }
        
        func fetchCharacters() -> Void {
            loadFavorites()
            isLoading = true
            let loader = CharacterLoader()
            Task {
                do {
                    let url = try loader.buildUrl(startIndex: startIndex, resultLimit: pageSize)
                    characterData = try await loader.loadModel(from: url)
                    startIndex += characterData.data.count ?? 0
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
#if DEBUG
                print("Removed \(id) from favorites")
#endif
            } else {
#if DEBUG
                favorites.append(id)
                print("Added \(id) from favorites")
#endif
            }
            let defaults = UserDefaults.standard
            defaults.set(favorites, forKey: "Favorites")
            if let index = characters.firstIndex(where: { $0.marvelId == id }) {
                characters[index].toggleFavorite()
                objectWillChange.send()
                #if DEBUG
                print("\(characters[index].name ?? "") isFavorite: \(characters[index].isFavorite)")
                #endif
            }
        }
        
        func isFavorite(id: Int) -> Bool {
            let index = favorites.firstIndex(of: id)
            return index != nil
        }
    }
}
