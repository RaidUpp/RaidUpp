//
//  Badge+CoreDataProperties.swift
//  RaidUpp
//
//  Created by Caio Soares on 14/06/23.
//
//

import Foundation
import CoreData


extension Badge {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Badge> {
        return NSFetchRequest<Badge>(entityName: "Badge")
    }

    @NSManaged public var title: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var caption: String?
    @NSManaged public var id: UUID?
    @NSManaged public var guild: Guild?
    @NSManaged public var mission: Mission?
    @NSManaged public var academy: Academy?
    @NSManaged public var student: Student?

}

extension Badge : Identifiable {

}
