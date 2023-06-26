//
//  GenerateName.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 26/06/23.
//

import CoreData

struct EntityName {
    static func generateName(_ obj: NSObject) -> String {
        if let validatedObj = obj as? NSManagedObject {

            switch type(of: validatedObj) {
            case is Academy.Type:
                guard let academy = validatedObj as? Academy else { fatalError() }
                return "\(academy.title!): \(academy.years!)"

            case is Student.Type:
                guard let student = validatedObj as? Student else { fatalError() }
                return "\(student.title!)"

            case is Guild.Type:
                guard let guild = validatedObj as? Guild else { fatalError() }
                return "\(guild.title!)"

            case is Mission.Type:
                guard let mission = validatedObj as? Mission else { fatalError() }
                return "\(mission.title!)"

            default:
                return "🐛 - Could not find correct return type, returning default"
            }
        }
        return "🐛 - Could not validate object, returning default"
    }
}
