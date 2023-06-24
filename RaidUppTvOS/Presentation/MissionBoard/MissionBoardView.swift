//
//  MissionBoardView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 19/06/23.
//

import SwiftUI

struct MissionBoardView: View {
    let guild: String
    let missionTypes: [MissionTypeImage] = [.bronze, .silver, .gold]
    let missionCount = 4

    @EnvironmentObject var entityFetcher: EntityFetcher

    var body: some View {
        VStack {
            BoardHeader(
                title: self.guild.capitalized,
                firstSubheadline: "Lorem ipsum dorem",
                secondSubheadline: "13 missões concluídas"
            )
            .focusSection()
            .padding(.bottom, 20)

            VStack(spacing: 50) {
                ForEach(missionTypes, id: \.title) { missionType in
                    VStack {
                        Text("Missões \(missionType.title)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                        ScrollView(.horizontal) {
                            HStack(spacing: 30) {
                                ForEach(0..<missionCount) { _ in
                                    NavigationLink {
                                        MissionDetailsView(
                                            missionTitle: "teste",
                                            startDate: "dd/mm/yyyy",
                                            endDate: "dd/mm/yyyy",
                                            missionDescription: "description",
                                            missionLeaders: ["alumni", "alumni"],
                                            rating: 3
                                        ).environmentObject(entityFetcher)
                                    } label: {
                                        MissionCard(
                                            image: missionType.image,
                                            title: "Mission title",
                                            description: "Mission description"
                                        ).buttonStyle(.card)
                                    }
                                    .buttonStyle(.card)
                                }
                            }
                            .padding(80)
                        }
                        .padding(-80)
                    }
                }
            }
        }
        .background {
            Image("background")
        }
    }
}

struct MissionBoardView_Previews: PreviewProvider {
    static var previews: some View {
        MissionBoardView(guild: "Design").environmentObject(EntityFetcher())
    }
}
