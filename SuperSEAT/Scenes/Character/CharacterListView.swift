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
            List(observed.characters) { character in
                NavigationLink {
                    CharacterDetailView()
                } label: {
                    CharacterListRow(character: character)
                }
            }
            .navigationTitle("Heros")
            .onAppear {
                observed.fetchCharacters()
            }
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
