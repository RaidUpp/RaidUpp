// TODO: Change the name of this file to something meaningful

import SwiftUI  // So we have access to @Published
import CoreData // So we can access our glorious CoreData entities

class DatabaseInteractor: ObservableObject {

    // MARK: - Initialization

    init() {
        managedObjectContext = PersistenceController.shared.container.viewContext
        if checkIfUserExists() { assignUser() } else { createUser() }

    }
    static let shared = DatabaseInteractor()

    // MARK: - Values

    @Published var mentor = Mentor()

    // MARK: - Persistence Interaction

    var managedObjectContext: NSManagedObjectContext!

    func saveData() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                print("- - -- - - - - - - - - ---- - -- - - - - -")
                print(error)
            }
        }
    }

    func genericLoad<T: NSManagedObject>(_ targetVariable: inout [T]) {
        let requestSample = type(of: targetVariable).Element
        let requestFetch = requestSample.fetchRequest()
        do {
            // swiftlint:disable force_cast
            targetVariable = try managedObjectContext.fetch(requestFetch) as! [T]
            print("Succesfully loaded \(requestSample)")
            // swiftlint:enable force_cast
        } catch {
            fatalError()
        }
    }

    func checkIfUserExists() -> Bool {
        let request = Mentor.fetchRequest()
        do {
            let response = try managedObjectContext.fetch(request)
            if response.isEmpty { return false } else { return true }
        } catch {
            fatalError()
        }
    }

    func createUser() {
        let user = Mentor(context: managedObjectContext)
        do {
            try managedObjectContext.save()
            self.mentor = user
        } catch { fatalError() }
    }

    func assignUser() {
        let request = Mentor.fetchRequest()
        do {
            self.mentor = try managedObjectContext.fetch(request).first!
        } catch {
            fatalError()
        }
    }

    func fetchEntitiesFor(_ host: NSManagedObject) -> NSSet {
        switch type(of: host) {
        case is Mentor.Type:
            // swiftlint:disable force_cast
            var host: Mentor = host as! Mentor
            return host.academies!
            // swiftlint:enable force_cast
        default:
            fatalError()
        }
    }

}
