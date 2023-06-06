//
//  RaidUppApp.swift
//  RaidUpp
//
//  Created by Caio Soares on 06/06/23.
//

import SwiftUI

@main
struct RaidUppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
