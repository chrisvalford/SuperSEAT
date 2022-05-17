//
//  CharacterDetailView.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import Kingfisher
import SwiftUI

struct CharacterDetailView: View {
    @Environment(\.openURL) var openURL
    var character: CharacterResult
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                KFImage(URL(string: (character.thumbnail?.path ?? "") + "." + (character.thumbnail?.`extension` ?? "")))
                    .loadDiskFileSynchronously()
                    .fade(duration: 0.25)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 200, maxWidth: .infinity, minHeight: 200)
                Text(character.description ?? "")
                    .padding(.horizontal)
                Spacer()
                Section {
                    Text("Comics")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(character.comics?.items ?? []) { comic in
                                Text(comic.name)
                                    .padding(8)
                                    .background(Color.black.opacity(0.25))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
                Section {
                    Text("Series")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(character.series?.items ?? []) { series in
                                Text(series.name)
                                    .padding(8)
                                    .background(Color.black.opacity(0.25))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
                Section {
                    Text("Stories")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(character.stories?.items ?? []) { story in
                                Text(story.name)
                                    .padding(8)
                                    .background(Color.black.opacity(0.25))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
                Section {
                    Text("Events")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(character.events?.items ?? []) { event in
                                Text(event.name)
                                    .padding(8)
                                    .background(Color.black.opacity(0.25))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle(character.name ?? "")
        .toolbar {
            ForEach(character.urls) { url in
                if url.type == "detail" {
                    Button {
                        openURL(URL(string: url.url)!)
                    } label: {
                        Image(systemName: "link.circle")
                    }
                }
            }
        }
        .accentColor(.black)
    }
}

//struct CharacterDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterDetailView()
//    }
//}

/*
Link(destination: URL(string: "https://www.apple.com")!) {
    Image(systemName: "link.circle.fill")
        .font(.largeTitle)
}
*/
