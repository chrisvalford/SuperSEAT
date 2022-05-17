//
//  CharacterDetailView+Observed.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 17/5/22.
//

import Foundation

extension CharacterDetailView {
    @MainActor
    class Observed: ObservableObject {
        
//        var characterData: CharacterResult? {
//            didSet {
//                print(characterData?.name)
//            }
//        }
        
        func fetchDetail(characterId: Int) {
            let loader = CharacterDetailLoader()
            Task {
                do {
                    let url = try loader.buildUrl(characterId: characterId)
                    let characterDetailData = try await loader.loadModel(from: url)
                } catch {
                    print(error)
                }
            }
            
            func fetchWebDetail(url: String) {
                let loader = CharacterDetailLoader()
                Task {
                    do {
                        let url = try loader.buildWebUrl(url: url)
                        let characterDetailData = try await loader.loadModel(from: url)
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}
