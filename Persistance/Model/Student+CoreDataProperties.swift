//
//  Student+CoreDataProperties.swift
//  RaidUpp
//
//  Created by Caio Soares on 14/06/23.
//
//

import Foundation
import CoreData

extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?
    @NSManaged public var academy: Academy?
    @NSManaged public var guild: Guild?
    @NSManaged public var soloBadges: Badge?

}

extension Student: Identifiable {

}
