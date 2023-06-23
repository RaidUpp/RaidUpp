//
//  Persistence.swift
//  RaidUpp
//
//  Created by Caio Soares on 06/06/23.
//

import CoreData
import CloudKit

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
//        for _ in 0..<10 {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "RaidUpp")
        
        guard let description = container.persistentStoreDescriptions.first else {
            fatalError("Error")
        }
//        container.persistentStoreDescriptions.first?.cloudKitContainerOptions? = .init(containerIdentifier: "com.RaidUpp")
//        description.cloudKitContainerOptions?.databaseScope = .public

//        description.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "com.RaidUpp")
//        container.persistentStoreDescriptions.first?.cloudKitContainerOptions?.databaseScope = .public
//        container.persistentStoreDescriptions = [description]

        let defaultDesctiption = container.persistentStoreDescriptions.first
        let url = defaultDesctiption?.url?.deletingLastPathComponent()

        let publicDescription = NSPersistentStoreDescription(url: url!.appendingPathComponent("public.sqlite"))
        let publicOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "iCloud.com.RaidUpp")
        publicOptions.databaseScope = .public
        publicDescription.cloudKitContainerOptions = publicOptions
//        publicDescription.configuration = "Public"
        publicDescription.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
        publicDescription.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        container.persistentStoreDescriptions = [publicDescription]

        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }

        container.viewContext.mergePolicy = NSMergePolicy(merge: .mergeByPropertyObjectTrumpMergePolicyType)
        container.viewContext.automaticallyMergesChangesFromParent = true


        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })

        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
