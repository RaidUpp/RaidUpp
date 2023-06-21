//
//  MenuViewModel.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 21/06/23.
//

import Foundation

class MenuViewModel: ObservableObject {

    var dataBase: DatabaseInteractor = DatabaseInteractor.shared
    @Published var classList: NSSet = NSSet()
    private var hostEntity: Mentor

    init(){
        self.dataBase = DatabaseInteractor.shared
        self.hostEntity = dataBase.mentor
        self.classList = dataBase.fetchEntitiesFor(hostEntity)
        print(classList)
    }
}
