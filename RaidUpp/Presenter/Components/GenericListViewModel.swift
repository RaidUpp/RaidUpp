//
//  ListViewModel.swift
//  RaidUpp
//
//  Created by Caio Soares on 16/06/23.
//

import Foundation
import CoreData

class ListViewModel: ObservableObject {

    init<T: NSManagedObject>(_ entryPoint: T?) {
        self.database = DatabaseInteractor.shared

        if entryPoint == nil {
//            self.mainGuestEntities = database.mentor.academies!
            self.listTitle = "Academy"
            self.hostEntity = self.database.mentor
            self.expectedGuest = Academy.self

            self.mainGuestEntities = database.fetchEntitiesFor(hostEntity)

            return
        }

        switch type(of: entryPoint!) {
        case is Academy.Type:
            guard let entity = entryPoint as? Academy else { fatalError() }
            self.hostEntity = entity

            self.expectedGuest = Student.self
            self.secondExpectedGuest = Guild.self

            self.mainGuestEntities = entity.students!
            self.scndGuestEntities = entity.guilds!

            self.listTitle = entity.title ?? "Turma Debug"
        default:
            fatalError()
        }
    }

    var database: DatabaseInteractor

    private var hostEntity: NSManagedObject
    private var expectedGuest: NSManagedObject.Type
    private var secondExpectedGuest: NSManagedObject.Type?

    @Published var mainGuestEntities = NSSet()
    @Published var scndGuestEntities = NSSet()

    @Published var listTitle: String

}

extension ListViewModel {

    func createEntity(guest: Int?, title: String/*, image: Data*/, subtitle: String) {
        switch type(of: hostEntity) {
        case is Mentor.Type:
            // swiftlint:disable force_cast
            var host: Mentor = hostEntity as! Mentor
            var newAcademy = Academy(context: database.managedObjectContext)
            // swiftlint:enable force_cast
            newAcademy.title = title
            newAcademy.years = subtitle

            host.addToAcademies(newAcademy)
            $mainGuestEntities.append(database.fetchEntitiesFor(host))

            database.saveData()
        case is Academy.Type:
            fatalError()
        default:
            fatalError()
        }
    }

}

class HomeViewModel: ListViewModel {



}
