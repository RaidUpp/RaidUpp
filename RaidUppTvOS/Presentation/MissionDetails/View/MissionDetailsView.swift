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
    
    init(missionTitle: String, startDate: String, endDate: String, missionDescription: String, missionLeaders: [String]?, rating: Int) {
        self.missionTitle = missionTitle
        self.startDate = startDate
        self.endDate = endDate
        self.missionDescription = missionDescription
        self.missionLeaders = missionLeaders
        self.rating = rating
    }
    
    var body: some View {
        VStack {
            MissionDetails(
                missionTitle: self.missionTitle,
                startDate: self.startDate,
                endDate: self.endDate,
                missionDescription: self.missionDescription,
                missionLeaders: nil,
                rating: self.rating
            )
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
            ])
        }
        .background {
            Image("background")
        }
    }
}

struct MissionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetailsView(missionTitle: "Mission title",
                           startDate: "DD/MM/YY",
                           endDate: "DD/MM/YY",
                           missionDescription: "Mission description here. Mission description here. Mission description here.",
                           missionLeaders: ["Teste1", "Teste2"],
                           rating: 4)
    }
}
