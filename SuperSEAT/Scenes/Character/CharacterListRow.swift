//
//  CharacterListRow.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import SwiftUI

struct CharacterListRow: View {
    
    var character: CharacterResult
    
    var body: some View {
        HStack {
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: (character.thumbnail?.path ?? "") + "." + (character.thumbnail?.`extension` ?? ""))){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
            } else {
                // Fallback on earlier versions
            }
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
