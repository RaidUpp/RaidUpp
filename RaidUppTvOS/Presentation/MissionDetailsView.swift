//
//  MissionDetailsView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 16/06/23.
//

import SwiftUI

struct MissionDetailsView: View {
    var body: some View {
        VStack {
            ZStack{
                HStack {
                    MissionDetails(missionTitle: "Mission title", startDate: "DD/MM/YY", endDate: "DD/MM/YY", missionDescription: "Mission description here. Mission description here. Mission description here. Mission description here. Mission description here. Mission description here. Mission description here. Mission description here. Mission description here. Mission description here. Mission description here. Mission description here. Mission description here. Mission description here. Mission description here. Mission description here. Mission description here. Mission description here. ", missionLeaders: nil, rating: 4)
                }
            }
        }
        .background {
            Image("background")
        }
    }
}

struct MissionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetailsView()
    }
}
