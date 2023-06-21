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
        ZStack {
            Image("background")
            VStack {
                Rectangle()
                    .foregroundColor(Color("gray-header"))
                    .frame(width: 1920, height: 380)
                    .ignoresSafeArea()
                Spacer()
            }

            HStack {
                MenuImageWithDescription(
                    imageName: self.guildType,
                    title: self.guildType.capitalized,
                    subtitle: "teste",
                    mentor: "Carolina Barbalho"
                )

                VStack(alignment: .leading, spacing: 36) {
                    Text(self.guildType.capitalized)
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(.bottom, 100)

                    NavigationLink {
                        MissionBoardView(guild: self.guildType)
                            .environmentObject(entityFetcher)
                    } label: {
                        MenuButton(title: "Missions")
                            .frame(width: 430, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                    .foregroundColor(Color("gray"))

                    NavigationLink {
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
                    } label: {
                        MenuButton(title: "Badges")
                            .frame(width: 430, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                    .foregroundColor(Color("gray"))

                    Button(action: {}) {
                        MenuButton(title: "Participants")
                            .frame(width: 430, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                    .foregroundColor(Color("gray"))

                    Button(action: {}) {
                        MenuButton(title: "Calendar/Meetings")
                            .frame(width: 430, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                    .foregroundColor(Color("gray"))
                }
                .padding(.leading, 80)
            }
        }
    }
}

struct GuildMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GuildMenuView(guildType: "design").environmentObject(EntityFetcher())
    }
}
