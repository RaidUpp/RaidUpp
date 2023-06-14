//
//  Mission.swift
//  RaidUpp
//
//  Created by Daniele Cavalcante on 13/06/23.
//

import Foundation

struct Mission: Identifiable {
    let id = UUID()
    var category: String
    var title: String
    var description: String?
    var beginDate: Date?
    var finishDate: Date?
    var leaders: [String]?
    var rating: Int = 0
}
