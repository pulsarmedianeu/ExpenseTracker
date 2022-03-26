//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Orszagh Sandor on 2022. 03. 25..
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    let persistenceController = CoreDataManager.shared

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
