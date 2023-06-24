//
//  RaidUppApp.swift
//  RaidUpp
//
//  Created by Caio Soares on 06/06/23.
//

import SwiftUI
import CoreData

@main
struct RaidUppApp: App {
    let persistenceController = PersistenceController.shared

    @State var hasLoadedCK: Bool = false

    var body: some Scene {
        WindowGroup {
            if hasLoadedCK {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext).task {
                        print("🛠️", DatabaseInteractor.shared.mentor.academies as Any)
                    }
            } else {
                EmptyView()
                    .onReceive(NotificationCenter.default.publisher(for: NSPersistentCloudKitContainer.eventChangedNotification)) { notification in
                        guard let event = notification.userInfo?[NSPersistentCloudKitContainer.eventNotificationUserInfoKey] as? NSPersistentCloudKitContainer.Event else {
                                return
                            }

                            let isFinished = event.endDate != nil

                            switch (event.type, isFinished) {
                                case (.import, false):
                                print("🛠️ Started downloading records")
                                case (.import, true):
                                print("🛠️ Finished downloading records")
                                print("🛠️", DatabaseInteractor.shared.fetchEntitiesFor(DatabaseInteractor.shared.mentor))
                                hasLoadedCK.toggle()

                                case (.export, false):
                                print("🛠️ Started uploading records")
                                case (.export, true):
                                print("🛠️ Finished uploading records")
                            default:
                                print("🛠️ Fetching somehow didn't even happen.")
                            }
                    }
            }
        }
    }
}
