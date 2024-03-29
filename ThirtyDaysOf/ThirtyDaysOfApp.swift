//
//  ThirtyDaysOfApp.swift
//  ThirtyDaysOf
//
//  Created by James Nunn on 3/1/2024.
//

import SwiftUI
import SwiftData

@main
struct ThirtyDaysOfApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Challenge.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}
