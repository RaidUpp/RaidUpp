//
//  GuildMenuView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 16/06/23.
//

import SwiftUI

struct GuildMenuView: View {

    @State var viewModel: GenericListViewModel

    var body: some View {
        GenericMenu(
            title: getTitle(viewModel.hostEntity),
            imageName: "guilds",
            imageTitle: getTitle(viewModel.hostEntity),
            imageSubtitle: getSubTitle(viewModel.hostEntity)
        ) {
            MenuButton(title: "Missions") {
                MissionBoardView(viewModel: GenericListViewModel(viewModel.hostEntity))
            }

            MenuButton(title: "Badges") {
//                BadgesView(
//                    guild: self.guildType,
//                    imagesNames: [
//                        "bronze",
//                        "gold",
//                        "silver",
//                        "silver",
//                        "gold",
//                        "bronze",
//                        "bronze",
//                        "gold",
//                        "silver",
//                        "silver",
//                        "gold",
//                        "bronze",
//                        "silver",
//                        "silver",
//                        "gold",
//                        "bronze",
//                        "bronze",
//                        "gold",
//                        "silver",
//                        "silver",
//                        "gold"
//                    ],
//                    viewModel: viewModel
//                )
            }

            MenuButton(title: "Participants") {}

            MenuButton(title: "Calendar/Meetings") {}
        }
    }
}

extension GuildMenuView {
    func getTitle(_ obj: NSObject) -> String {
        guard let guild = obj as? Guild else {
            return "🛠️ - Couldn't load entity as Academy: \(obj)"
        }
        return guild.title!
    }

    func getSubTitle(_ obj: NSObject) -> String {
        guard let guild = obj as? Guild else {
            return "🛠️ - Couldn't load entity as Academy: \(obj)"
        }
        return guild.subtitle!
    }
}
