//
//  ListViewModel.swift
//  RaidUpp
//
//  Created by Caio Soares on 16/06/23.
//

import Foundation
import CoreData

class GenericListViewModel: ObservableObject {

    init<T: NSManagedObject>(_ entryPoint: T?) {
        self.database = DatabaseInteractor.shared

        if entryPoint == nil {
            self.listTitle = "Academy"
            self.hostEntity = self.database.mentor
            self.expectedGuest = Academy.self
            self.mainGuestEntities = database.fetchEntitiesFor(hostEntity)
            return
        }

        // TODO: - Mentor -> Academy, Academy -> Guilda, Academy -> Students
        switch type(of: entryPoint!) {
        case is Academy.Type:
            guard let entity = entryPoint as? Academy else { fatalError() }
            self.hostEntity = entity

            self.expectedGuest = Student.self
            self.secondExpectedGuest = Guild.self

            self.mainGuestEntities = entity.students!
            self.scndGuestEntities = entity.guilds!

            self.listTitle = entity.title ?? "Turma Debug"
        case is Student.Type:
            guard let entity = entryPoint as? Student else { fatalError() }
            self.hostEntity = entity

            self.expectedGuest = Badge.self

            self.mainGuestEntities = entity.soloBadges!

            self.listTitle = entity.title ?? "Turma Debug"
        default:
            fatalError()
        }
    }

    var database: DatabaseInteractor

    public var hostEntity: NSManagedObject
    private var expectedGuest: NSManagedObject.Type
    private var secondExpectedGuest: NSManagedObject.Type?

    @Published var mainGuestEntities = NSSet()
    @Published var scndGuestEntities = NSSet()

    @Published var listTitle: String

}

extension GenericListViewModel {
    func createEntity(guest: Int?, title: String/*, image: Data*/, subtitle: String) {
        switch type(of: hostEntity) {
        case is Mentor.Type:
            guard let host: Mentor = hostEntity as? Mentor else { fatalError() }
            let newAcademy = Academy(context: database.managedObjectContext)
            newAcademy.title = title
            newAcademy.years = subtitle
            host.addToAcademies(newAcademy) // host: mentor, host tem um método que é para adicionar a suas relações
            _ = $mainGuestEntities.append(database.fetchEntitiesFor(host))
        case is Academy.Type:
            guard let host: Academy = hostEntity as? Academy else { fatalError() }
            switch guest {
            case 0:
                let newStudent = Student(context: database.managedObjectContext)
                newStudent.title = title
                newStudent.subtitle = subtitle
                host.addToStudents(newStudent)
                _ = $mainGuestEntities.append(database.fetchEntitiesFor(host))
            case 1:
                let newGuild = Guild(context: database.managedObjectContext)
                newGuild.title = title
                newGuild.subtitle = subtitle
                host.addToGuilds(newGuild)
                _ = $scndGuestEntities.append(database.fetchEntitiesFor(host))
            default:
                fatalError()
            }
        default:
            fatalError()
        }
        database.saveData()
    }

    public  func creaateAcademyEntity(title: String, subtitle: String) {
        guard let host: Mentor = self.hostEntity as? Mentor else { fatalError() }
        let newAcademy = Academy(context: database.managedObjectContext)
        newAcademy.title = title
        newAcademy.years = subtitle
        host.addToAcademies(newAcademy)
        _ = $mainGuestEntities.append(database.fetchEntitiesFor(host))
    }

    private func creaateStudentEntity(title: String, subtitle: String, hostEntity: Academy.Type) {
        guard let host: Academy = self.hostEntity as? Academy else { fatalError() }
        let newStudent = Student(context: database.managedObjectContext)
        newStudent.title = title
        newStudent.subtitle = subtitle
        host.addToStudents(newStudent)
        _ = $mainGuestEntities.append(database.fetchEntitiesFor(host))
    }

    private func creaateGuildEntity(title: String, subtitle: String, hostEntity: Academy.Type) {
        guard let host: Academy = self.hostEntity as? Academy else { fatalError() }
        let newGuild = Guild(context: database.managedObjectContext)
        newGuild.title = title
        newGuild.subtitle = subtitle
        host.addToGuilds(newGuild)
        _ = $scndGuestEntities.append(database.fetchEntitiesFor(host))
    }

    private func creaateGlobalBadgesEntity(title: String, subtitle: String, hostEntity: Academy.Type) {
        guard let host: Academy = self.hostEntity as? Academy else { fatalError() }
        let newBadge = Badge(context: database.managedObjectContext)
        newBadge.title = title
        newBadge.subtitle = subtitle
        host.addToGlobalBadges(newBadge)
        _ = $scndGuestEntities.append(database.fetchEntitiesFor(host))
    }

    private func creaateAcademyEntity(title: String, subtitle: String, hostEntity: Guild.Type) {

    }

    private func creaateStudentEntity(title: String, subtitle: String, hostEntity: UUID) {

    }

}

class HomeViewModel: GenericListViewModel {

}

extension NSSet: ObservableObject {

}
