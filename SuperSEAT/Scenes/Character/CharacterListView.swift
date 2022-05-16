//
//  CharacterListView.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var observed = Observed()
    
    var body: some View {
        NavigationView {
            InfiniteList(data: $observed.characters,
                         isLoading: $observed.isLoading,
                         loadMore: observed.fetchCharacters) { character in
                NavigationLink {
                    CharacterDetailView()
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
            .navigationTitle("Heros")
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
