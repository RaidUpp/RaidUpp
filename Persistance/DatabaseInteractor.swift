// TODO: Change the name of this file to something meaningful

import SwiftUI  // So we have access to @Published
import CoreData // So we can access our glorious CoreData entities
import CloudKit

class DatabaseInteractor: ObservableObject {

    // MARK: - Initialization

    init() {
        managedObjectContext = PersistenceController.shared.container.viewContext
        if checkIfUserExists() { assignUser() } else { /*createUser()*/ }
        print("User id -> \(self.mentor.description)")

        // IPAD: User id -> <Mentor: 0x60000129e3f0> (entity: Mentor; id: 0xb46ba92484b05914 <x-coredata://29634696-AC25-46E0-9ED9-56F210EB6DB0/Mentor/p1>; data: <fault>)

        // TV: User id -> <Mentor: 0x60000153e490> (entity: Mentor; id: 0xa87cb506d87979f4 <x-coredata://B8F2EE0E-21D8-4B4B-BBE0-D6ACB0DA3FD5/Mentor/p1>; data: <fault>)


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
            if response.isEmpty { print("user doesn't exists") ; return false }
            else { print("user exists") ; return true }
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
            let host: Mentor = host as! Mentor
            return host.academies!
            // swiftlint:enable force_cast
        default:
            fatalError()
        }
    }

}
