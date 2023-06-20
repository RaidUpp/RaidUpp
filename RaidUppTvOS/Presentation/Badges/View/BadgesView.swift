//
//  BadgesView.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 19/06/23.
//

import SwiftUI

struct BadgesView: View {
    let guild: String
    let imagesNames: [String]

    init(guild: String, imagesNames: [String]) {
        self.guild = guild
        self.imagesNames = imagesNames
    }
    
    var body: some View {
        VStack(spacing: 34){
            BoardHeader(title: self.guild.capitalized, firstSubheadline: "Lorem ipsum dorem", secondSubheadline: "\(imagesNames.count) badges")
                .focusSection()

            buildGrid()

        }.background {
            Image("background")
        }
    }

    private func buildGrid() -> some View {
        return ScrollView(showsIndicators: false) {
            LazyVGrid(
                columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ],
                spacing: 16) {
                    ForEach(imagesNames.indices, id: \.self) { index in
                        let imageName = imagesNames[index]
                        Button(action: {}) {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .id(index)
                        }
                        .buttonStyle(.plain)
                        .frame(
                            width: 308,
                            height: 308
                        )
                    }
            }
        }
    }
}

struct BadgesView_Previews: PreviewProvider {
    static var previews: some View {
        BadgesView(
            guild: "Design",
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

        )
    }
}
