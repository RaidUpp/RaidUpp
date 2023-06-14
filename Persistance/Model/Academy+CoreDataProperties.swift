//
//  Academy+CoreDataProperties.swift
//  RaidUpp
//
//  Created by Caio Soares on 14/06/23.
//
//

import Foundation
import CoreData

extension Academy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Academy> {
        return NSFetchRequest<Academy>(entityName: "Academy")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var years: String?
    @NSManaged public var globalBadges: Badge?
    @NSManaged public var guilds: NSSet?
    @NSManaged public var students: NSSet?

}

// MARK: Generated accessors for guilds
extension Academy {

    @objc(addGuildsObject:)
    @NSManaged public func addToGuilds(_ value: Guild)

    @objc(removeGuildsObject:)
    @NSManaged public func removeFromGuilds(_ value: Guild)

    @objc(addGuilds:)
    @NSManaged public func addToGuilds(_ values: NSSet)

    @objc(removeGuilds:)
    @NSManaged public func removeFromGuilds(_ values: NSSet)

}

// MARK: Generated accessors for students
extension Academy {

    @objc(addStudentsObject:)
    @NSManaged public func addToStudents(_ value: Student)

    @objc(removeStudentsObject:)
    @NSManaged public func removeFromStudents(_ value: Student)

    @objc(addStudents:)
    @NSManaged public func addToStudents(_ values: NSSet)

    @objc(removeStudents:)
    @NSManaged public func removeFromStudents(_ values: NSSet)

}

extension Academy: Identifiable {

}
