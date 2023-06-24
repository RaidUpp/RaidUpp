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
            self.guestEntities = database.fetchEntitiesFor(hostEntity)
            return
        }

        // TODO: - Mentor -> Academy, Academy -> Guilda, Academy -> Students
        switch type(of: entryPoint!) {
        case is Academy.Type:
            guard let entity = entryPoint as? Academy else { fatalError() }
            self.hostEntity = entity
            self.expectedGuest = Student.self
            self.secondExpectedGuest = Guild.self
            self.guestEntities = entity.students!
            self.alternativeGuestEntities = entity.guilds!
            self.listTitle = entity.title ?? "Turma Debug"
        case is Student.Type:
            guard let entity = entryPoint as? Student else { fatalError() }
            self.hostEntity = entity
            self.expectedGuest = Badge.self
            self.guestEntities = entity.soloBadges!
            self.listTitle = entity.title ?? "Turma Debug"
        default:
            fatalError()
        }
    }

    var database: DatabaseInteractor

    public var hostEntity: NSManagedObject
    private var expectedGuest: NSManagedObject.Type
    private var secondExpectedGuest: NSManagedObject.Type?

    @Published var guestEntities = NSSet()
    @Published var alternativeGuestEntities = NSSet()

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
            _ = $guestEntities.append(database.fetchEntitiesFor(host))
        case is Academy.Type:
            guard let host: Academy = hostEntity as? Academy else { fatalError() }
            switch guest {
            case 0:
                let newStudent = Student(context: database.managedObjectContext)
                newStudent.title = title
                newStudent.subtitle = subtitle
                host.addToStudents(newStudent)
                _ = $guestEntities.append(database.fetchEntitiesFor(host))
            case 1:
                let newGuild = Guild(context: database.managedObjectContext)
                newGuild.title = title
                newGuild.subtitle = subtitle
                host.addToGuilds(newGuild)
                _ = $alternativeGuestEntities.append(database.fetchEntitiesFor(host))
            default:
                fatalError()
            }
        default:
            fatalError()
        }
        database.saveData()
    }

    public func createAcademyEntity(title: String, subtitle: String) {
        guard let host: Mentor = self.hostEntity as? Mentor else { fatalError() }
        let newAcademy = Academy(context: database.managedObjectContext)
        newAcademy.title = title
        newAcademy.years = subtitle
        host.addToAcademies(newAcademy)
        _ = $guestEntities.append(database.fetchEntitiesFor(host))
        database.saveData()
    }

    public func createStudentEntity(title: String, subtitle: String) {
        guard let host: Academy = self.hostEntity as? Academy else { fatalError() }
        let newStudent = Student(context: database.managedObjectContext)
        newStudent.title = title
        newStudent.subtitle = subtitle
        host.addToStudents(newStudent)
        _ = $guestEntities.append(database.fetchEntitiesFor(host))
        database.saveData()
    }

    public func createGuildEntity(title: String, subtitle: String) {
        guard let host: Academy = self.hostEntity as? Academy else { fatalError() }
        let newGuild = Guild(context: database.managedObjectContext)
        newGuild.title = title
        newGuild.subtitle = subtitle
        host.addToGuilds(newGuild)
        _ = $alternativeGuestEntities.append(database.fetchEntitiesFor(host))
        database.saveData()
    }

    public func createGlobalBadgesEntity(title: String, subtitle: String, hostEntity: Academy.Type) {
        guard let host: Academy = self.hostEntity as? Academy else { fatalError() }
        let newBadge = Badge(context: database.managedObjectContext)
        newBadge.title = title
        newBadge.subtitle = subtitle
        host.addToGlobalBadges(newBadge)
        _ = $alternativeGuestEntities.append(database.fetchEntitiesFor(host))
        database.saveData()
    }

    public func createGuildBadgesEntity(title: String, subtitle: String, hostEntity: Guild.Type) {

    }

    public func createMissionEntity(title: String, subtitle: String, hostEntity: UUID) {

    }

}

extension GenericListViewModel {

    public func fetchGuilds(_ host: Academy) -> NSSet? {
        guard let guilds = host.guilds else { return nil }
        return guilds
    }

}

extension NSSet: ObservableObject {

}
