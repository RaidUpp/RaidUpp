//
//  MissionTypeImage.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 14/06/23.
//

import SwiftUI

struct MissionTypeImage {
    let image: Image
    let title: String

    static let gold = MissionTypeImage(image: Image("gold"), title: "ouro")
    static let silver = MissionTypeImage(image: Image("silver"), title: "prata")
    static let bronze = MissionTypeImage(image: Image("bronze"), title: "bronze")
}
