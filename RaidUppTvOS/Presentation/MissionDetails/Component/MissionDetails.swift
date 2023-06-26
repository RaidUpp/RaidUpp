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
    var rating: Int = 0

    @State var viewModel: GenericListViewModel

    var body: some View {
        HStack {
            VStack(alignment: .trailing, spacing: 8) {
                HStack(spacing: 10) {
                    ForEach(0..<5) { index in
                        Image(systemName: index < rating ? "star.fill" : "star.fill")
                            .foregroundColor(index < rating ? .white : .white.opacity(0.5))
                    }
                }
                .padding(.top, 50)
                Text("Leaders")
                    .font(.caption2)
                    .foregroundColor(.black)
                    .padding(.top, 32)
                ForEach(missionLeaders?.prefix(2) ?? [], id: \.self) { leader in
                    Text(leader)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                Spacer()
            }
            .padding(.leading, -150)
            VStack(alignment: .leading, spacing: 16) {
                Text(self.missionTitle)
                    .font(.title2)
                    .foregroundColor(.black)
                HStack {
                    Text(self.startDate)
                    Text(self.endDate)
                }
                .font(.body)
                .foregroundColor(.gray)
                Text(self.missionDescription)
                    .font(.body)
                    .foregroundColor(.black)
                    .frame(width: 823, height: 180)
                HStack {
                    Button {} label: {
                        Image(systemName: "checkmark")
                    }
                    Button {} label: {
                        Image(systemName: "star.fill")
                    }
                    Button {} label: {
                        Image(systemName: "ellipsis")
                    }
                }
                .frame(width: 474, height: 114)
            }
            Image("gold")
                .resizable()
                .frame(width: 368, height: 368)
        }
        .frame(width: 1505, height: 521)
//        .background(.white)
    }
}
