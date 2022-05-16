//
//  SuperSEATApp.swift
//  SuperSEAT
//
//  Created by Christopher Alford on 16/5/22.
//

import SwiftUI

@main
struct SuperSEATApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CharacterListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
