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

    @State var viewModel: GenericListViewModel

    var body: some View {
        VStack(spacing: 30) {
            BoardHeader(
                title: self.guild.capitalized,
                firstSubheadline: "Lorem ipsum dorem",
                secondSubheadline: "\(imagesNames.count) badges"
            ).focusSection()

            buildGrid()
                .padding(.horizontal, -80)

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
                spacing: 50
            ) {
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
                        width: 250,
                        height: 250
                    )
                }
            }
        }
    }
}
