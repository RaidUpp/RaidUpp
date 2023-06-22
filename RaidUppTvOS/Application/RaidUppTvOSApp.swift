//
//  RaidUppTvOSApp.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 13/06/23.
//

import SwiftUI

@main
struct RaidUppTvOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                MenuView(classesList: [
                    "Turma 2022",
                    "Turma 2020",
                    "Turma 2018",
                    "Turma 2016",
                    "Turma 2014"
                ]).environment(
                    \.managedObjectContext,
                     persistenceController.container.viewContext
                )

//                GuildView().environmentObject(EntityFetcher())
            }
        }
    }
}
