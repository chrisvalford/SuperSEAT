//
//  CharacterListView.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var observed = Observed()
    @State var favorites: [Int] = []
    
    var body: some View {
        NavigationView {
            InfiniteList(data: $observed.characters,
                         isLoading: $observed.isLoading,
                         loadMore: observed.fetchCharacters) { character in
                NavigationLink {
                    CharacterDetailView(character: character,
                                        isFavorite: (favorites.firstIndex(of: character.marvelId) != nil),
                                        favoriteButtonAction: { id in
                        updateFavorite(id: id)
                    })
                    .onAppear {
                        if character == observed.characters.last {
                            print("Load more")
                            observed.fetchCharacters()
                        }
                    }
                } label: {
                    CharacterListRow(character: character)
                }
            }
                         .padding(.horizontal, -12)
                         .navigationTitle("Heros")
        }
        .accentColor(.black)
    }
    
    func updateFavorite(id: Int) {
        if let index = favorites.firstIndex(of: id) {
            favorites.remove(at: index)
            print("Removed \(id)")
        } else {
            favorites.append(id)
            print("Added \(id)")
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
