//
//  Mission+CoreDataProperties.swift
//  RaidUpp
//
//  Created by Caio Soares on 14/06/23.
//
//

import Foundation
import CoreData


extension Mission {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mission> {
        return NSFetchRequest<Mission>(entityName: "Mission")
    }

    @NSManaged public var type: String?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var caption: String?
    @NSManaged public var badge: Badge?

}

extension Mission : Identifiable {

}
