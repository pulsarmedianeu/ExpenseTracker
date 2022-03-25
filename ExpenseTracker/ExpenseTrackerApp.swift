//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Orszagh Sandor on 2022. 03. 25..
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
