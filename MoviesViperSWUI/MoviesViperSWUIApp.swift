//
//  MoviesViperSWUIApp.swift
//  MoviesViperSWUI
//
//  Created by Jose Preatorian on 30-01-26.
//

import SwiftUI

@main
struct MoviesViperSWUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LaunchView()
            //ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
