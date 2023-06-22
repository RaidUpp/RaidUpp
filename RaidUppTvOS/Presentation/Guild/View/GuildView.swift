//
//  ContentView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 13/06/23.
//

import SwiftUI

struct GuildView: View {
    let missionTypes: [MissionTypeImage] = [.bronze, .silver, .gold]
    let missionCount = 4

    @EnvironmentObject var entityFetcher: EntityFetcher

    var body: some View {
        GenericMenu(
            title: "Guilds",
            imageName: "guilds",
            mentor: "Caroline Barreto"
        ) {
            MenuButton(title: "Code") {
                GuildMenuView(guildType: "code").environmentObject(entityFetcher)
            }

            MenuButton(title: "Design") {
                GuildMenuView(guildType: "design").environmentObject(entityFetcher)
            }

            MenuButton(title: "Management") {
                GuildMenuView(guildType: "management").environmentObject(entityFetcher)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GuildView().environmentObject(EntityFetcher())
    }
}
