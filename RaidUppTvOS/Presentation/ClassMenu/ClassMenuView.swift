//
//  ClassMenuView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 22/06/23.
//

import SwiftUI

struct ClassMenuView: View {
    
    @State var viewModel: GenericListViewModel

    var body: some View {
        GenericMenu(
            title: getTitle(viewModel.hostEntity),
            imageName: "class-image",
            imageTitle: EntityName.generateName(viewModel.hostEntity),
            content: {
                MenuButton(title: "Guilds") {
                    GuildView(viewModel: GenericListViewModel(viewModel.hostEntity))
                }
                MenuButton(title: "Class missions") {}
                MenuButton(title: "Individual missions") {}
                MenuButton(title: "Participants") {
                    ParticipantsView()
                }
            }
        )
    }
}

extension ClassMenuView {
    func getTitle(_ obj: NSObject) -> String {
        guard let academy = obj as? Academy else {
            return "🛠️ - Couldn't load entity as Academy: \(obj)"
        }
        return academy.title!
    }
}
