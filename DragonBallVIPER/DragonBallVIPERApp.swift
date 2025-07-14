//
//  DragonBallVIPERApp.swift
//  DragonBallVIPER
//
//  Created by JJ Romero Alvarez on 14/7/25.
//

import SwiftUI

@main
struct DragonBallVIPERApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
