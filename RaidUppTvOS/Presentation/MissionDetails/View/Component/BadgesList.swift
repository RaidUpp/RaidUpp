//
//  BadgesList.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 19/06/23.
//

import SwiftUI

struct BadgesList: View {
    let imagesNames: [String]

    @EnvironmentObject var entityFetcher: EntityFetcher

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {

            Text("Badges Relacionadas")
                .font(.body)
                .foregroundColor(.black)

            ScrollView(
                .horizontal,
                showsIndicators: false
            ) {
                badges().padding()
            }
        }
        .padding()
        .background(
            Color(.white).opacity(0.5)
        )
    }

    private func badges() -> some View {
        return HStack(spacing: 50) {
            ForEach(imagesNames, id: \.self) { imageName in
                Button(action: {}) {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                }
                .buttonStyle(.plain)
                .frame(
                    width: 204,
                    height: 204
                )
            }
        }
    }
}

struct BadgesList_Previews: PreviewProvider {
    static var previews: some View {
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
        ]).environmentObject(EntityFetcher())
    }
}
