//
//  RaidUppApp.swift
//  RaidUpp
//
//  Created by Caio Soares on 06/06/23.
//

import SwiftUI
import CoreData

//struct TestView: View {
//
//    @Environment(\.managedObjectContext) private var viewContext
//
//
//
//    var body: some View {
//        Button("Test") {
//            print("🛠️", DatabaseInteractor.shared.fetchEntitiesFor(DatabaseInteractor.shared.mentor))
//        }
//        .onReceive(NotificationCenter.default.publisher(for: NSPersistentCloudKitContainer.eventChangedNotification)) { notification in
//            guard let event = notification.userInfo?[NSPersistentCloudKitContainer.eventNotificationUserInfoKey] as? NSPersistentCloudKitContainer.Event else {
//                    return
//                }
//
//                let isFinished = event.endDate != nil
//
//                switch (event.type, isFinished) {
//                    case (.import, false):
//                    print("🛠️ Started downloading records")
//                    case (.import, true):
//                    print("🛠️", DatabaseInteractor.shared.fetchEntitiesFor(DatabaseInteractor.shared.mentor))
//                    print("🛠️ Finished downloading records")
//
//                    case (.export, false):
//                    print("🛠️ Started uploading records")
//                    case (.export, true):
//                    print("🛠️ Finished uploading records")
//                default:
//                    print("🛠️ default")
//                }
//        }
//    }
//    }

/*
 Relationship 'academies' fault on managed object (0x60000214d270)
 <Mentor: 0x60000214d270> (entity: Mentor; id: 0x8e9f6ba475f9dff3
 <x-coredata://726A7BCA-54F3-46A8-AE1E-0E6028CE9678/Mentor/p1>
             //E1D942E9-0938-402E-9DDD-030B7D70CD4F
 ; data: {
     academies = "<relationship fault: 0x600000285b60 'academies'>";
     name = "Ping Pongerson";
 })

 */






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
                                print("🛠️ default")
                            }
                    }
            }
        }
    }
}
