//
//  CharacterListRow.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import Kingfisher
import SwiftUI

struct CharacterListRow: View {
    
    var character: CharacterResult
    
    var body: some View {
        HStack {
                KFImage(URL(string: (character.thumbnail?.path ?? "") + "." + (character.thumbnail?.`extension` ?? "")))
                .loadDiskFileSynchronously()
                .fade(duration: 0.25)
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(character.name ?? "")
                    .font(.headline)
                Text(character.description ?? "")
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
    }
}

//struct CharacterListRow_Previews: PreviewProvider {
//    static let character = CharacterResult()
//    static var previews: some View {
//        CharacterListRow(character: character)
//    }
//}
