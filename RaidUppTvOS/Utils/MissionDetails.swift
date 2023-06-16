//
//  MissionDetails.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 16/06/23.
//

import SwiftUI

struct MissionDetails: View {
    let missionTitle: String
    let startDate: String
    let endDate: String
    let missionDescription: String
    let missionLeaders: [String]?
    
    init(missionTitle: String, startDate: String, endDate: String, missionDescription: String, missionLeaders: [String]?) {
        self.missionTitle = missionTitle
        self.startDate = startDate
        self.endDate = endDate
        self.missionDescription = missionDescription
        self.missionLeaders = missionLeaders
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .trailing, spacing: 8) {
                Text("Leaders")
                    .font(.caption2)
                    .foregroundColor(.black)
                    // .alignmentGuide(.leading) { _ in 0 }
                ForEach(missionLeaders?.prefix(2) ?? [], id: \.self) { leader in
                    Text(leader)
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(self.missionTitle)
                    .font(.title2)
                    .foregroundColor(.black)
                HStack {
                    Text(self.startDate)
                        // .alignmentGuide(.leading) { _ in 0 }
                    Text(self.endDate)
                }
                .font(.body)
                .foregroundColor(.gray)
                Text(self.missionDescription)
                    .font(.body)
                    .foregroundColor(.black)
                    .frame(width: 823, height: 180)
            }
        }
        .background(Color.white)
    }
}

struct MissionDetails_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetails(missionTitle: "Title", startDate: "aaaaa", endDate: "bbbbb", missionDescription: "daiosjo dsoijdoiaj dlasijdlijdlijaoisdjioajsf kjdnskjfoisdjofjsodjfs", missionLeaders: ["Teste1", "Teste2", "teste3"])
    }
}
