//
//  booking_appApp.swift
//  booking app
//
//  Created by paulprakash ladarla on 27/09/25.
//

import SwiftUI
import CoreData

@main
struct booking_appApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
