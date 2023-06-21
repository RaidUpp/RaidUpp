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

    @EnvironmentObject var entityFetcher: EntityFetcher

    var body: some View {
        VStack {
            MissionDetails(
                missionTitle: self.missionTitle,
                startDate: self.startDate,
                endDate: self.endDate,
                missionDescription: self.missionDescription,
                missionLeaders: nil,
                rating: self.rating
            ).environmentObject(entityFetcher)
            Spacer()
            BadgesList(imagesNames: [
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
            ]).environmentObject(entityFetcher)
        }
        .background {
            Image("background")
        }
    }
}

struct MissionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetailsView(
            missionTitle: "Mission title",
            startDate: "DD/MM/YY",
            endDate: "DD/MM/YY",
            missionDescription: "Mission description here. Mission description here. Mission description here.",
            missionLeaders: ["Teste1", "Teste2"],
            rating: 4
        ).environmentObject(EntityFetcher())
    }
}
