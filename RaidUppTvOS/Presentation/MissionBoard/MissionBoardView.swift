//
//  MissionBoardView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 19/06/23.
//

import SwiftUI

struct MissionBoardView: View {
    let missionTypes: [MissionTypeImage] = [.bronze, .silver, .gold]
    let missionCount = 4

    @State var viewModel: GenericListViewModel

    var body: some View {
        VStack {
            BoardHeader(
                title: getTitle(viewModel.hostEntity),
                firstSubheadline: getSubTitle(viewModel.hostEntity),
                secondSubheadline: "13 missões concluídas"
            )
            .focusSection()
            .padding(.bottom, 20)

            VStack(spacing: 50) {
                // FIXME: This first ForEach should build the lines referring to the badges of the missions
                ForEach(missionTypes, id: \.title) { missionType in
                    VStack {
                        Text("Missões \(missionType.title)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                        ScrollView(.horizontal) {
                            HStack(spacing: 30) {
                                // FIXME: This second ForEach must build the missions related to their badges
                                ForEach(0..<missionCount) { _ in
                                    NavigationLink {
                                        MissionDetailsView(
                                            missionTitle: "teste",
                                            startDate: "dd/mm/yyyy",
                                            endDate: "dd/mm/yyyy",
                                            missionDescription: "description",
                                            missionLeaders: ["alumni", "alumni"],
                                            rating: 3,
                                            viewModel: viewModel
                                        )
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

extension MissionBoardView {
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
