//
//  Guild+CoreDataProperties.swift
//  RaidUpp
//
//  Created by Caio Soares on 14/06/23.
//
//

import Foundation
import CoreData


extension Guild {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Guild> {
        return NSFetchRequest<Guild>(entityName: "Guild")
    }

    @NSManaged public var icon: String?
    @NSManaged public var id: UUID?
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?
    @NSManaged public var academy: Academy?
    @NSManaged public var guildBadges: NSSet?
    @NSManaged public var student: NSSet?

}

// MARK: Generated accessors for guildBadges
extension Guild {

    @objc(addGuildBadgesObject:)
    @NSManaged public func addToGuildBadges(_ value: Badge)

    @objc(removeGuildBadgesObject:)
    @NSManaged public func removeFromGuildBadges(_ value: Badge)

    @objc(addGuildBadges:)
    @NSManaged public func addToGuildBadges(_ values: NSSet)

    @objc(removeGuildBadges:)
    @NSManaged public func removeFromGuildBadges(_ values: NSSet)

}

// MARK: Generated accessors for student
extension Guild {

    @objc(addStudentObject:)
    @NSManaged public func addToStudent(_ value: Student)

    @objc(removeStudentObject:)
    @NSManaged public func removeFromStudent(_ value: Student)

    @objc(addStudent:)
    @NSManaged public func addToStudent(_ values: NSSet)

    @objc(removeStudent:)
    @NSManaged public func removeFromStudent(_ values: NSSet)

}

extension Guild: Identifiable {

}
