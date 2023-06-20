//
//  MissionSection.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 15/06/23.
//

import SwiftUI

struct MissionSection: View {
    let missionType: MissionTypeImage
    let missionCount: Int
    
    var body: some View {
        VStack {
            Text("Missões \(missionType.title)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.gray)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<missionCount) { _ in
                        MissionCard(image: missionType.image, title: "Mission title", description: "Mission description")
                            .buttonStyle(.card)
                    }
                }
                .padding(80)
            }
            .padding(-80)
        }
    }
}

struct MissionSection_Previews: PreviewProvider {
    static var previews: some View {
        MissionSection(missionType: .bronze, missionCount: 4)
    }
}
