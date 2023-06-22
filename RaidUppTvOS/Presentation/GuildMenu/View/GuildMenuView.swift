//
//  GuildMenuView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 16/06/23.
//

import SwiftUI

struct GuildMenuView: View {
    let guildType: String

    @EnvironmentObject var entityFetcher: EntityFetcher

    var body: some View {
        GenericMenu(
            title: self.guildType.capitalized,
            imageName: self.guildType,
            imageTitle: self.guildType.capitalized,
            imageSubtitle: "test"
        ) {
            MenuButton(title: "Missions") {
                MissionBoardView(guild: self.guildType)
                    .environmentObject(entityFetcher)
            }

            MenuButton(title: "Badges") {
                BadgesView(
                    guild: self.guildType,
                    imagesNames: [
                        "bronze",
                        "gold",
                        "silver",
                        "silver",
                        "gold",
                        "bronze",
                        "bronze",
                        "gold",
                        "silver",
                        "silver",
                        "gold",
                        "bronze"
                    ]
                ).environmentObject(entityFetcher)
            }

            MenuButton(title: "Participants") {}

            MenuButton(title: "Calendar/Meetings") {}
        }
    }
}

struct GuildMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GuildMenuView(guildType: "design").environmentObject(EntityFetcher())
    }
}
