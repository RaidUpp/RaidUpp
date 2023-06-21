//
//  MenuViewModel.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 21/06/23.
//

import Foundation

class EntityFetcher: ObservableObject {

    var dataBase: DatabaseInteractor = DatabaseInteractor.shared
    @Published var entities: NSSet = NSSet()
    private var hostEntity: Mentor

    init() {
        self.dataBase = DatabaseInteractor.shared
        self.hostEntity = dataBase.mentor
        self.entities = dataBase.fetchEntitiesFor(hostEntity)
        print(entities)
    }
}
