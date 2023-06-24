//
//  MenuViewModel.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 21/06/23.
//

import Foundation
import CoreData

class EntityFetcher: ObservableObject {

    var dataBase: DatabaseInteractor = DatabaseInteractor.shared

    init() {
        self.dataBase = DatabaseInteractor.shared

        self.hostEntity = dataBase.mentor
        self.mainEntities = dataBase.fetchEntitiesFor(hostEntity)

//        print(mainEntities)
    }

    private var hostEntity: Mentor
    @Published var mainEntities = NSSet()
}
