//
//  MissionDetailsView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 16/06/23.
//

import SwiftUI

struct MissionDetailsView: View {
    let missionTitle: String
    let startDate: String
    let endDate: String
    let missionDescription: String
    let missionLeaders: [String]?
    var rating: Int

    @State var viewModel: GenericListViewModel

    var body: some View {
        VStack {
            MissionDetails(
                missionTitle: self.missionTitle,
                startDate: self.startDate,
                endDate: self.endDate,
                missionDescription: self.missionDescription,
                missionLeaders: nil,
                rating: self.rating,
                viewModel: viewModel
            )
            Spacer()
            BadgesList(
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
                ],
                viewModel: viewModel
            )
        }
        .background {
            Image("background")
        }
    }
}
