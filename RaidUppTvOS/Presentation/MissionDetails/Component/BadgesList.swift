//
//  BadgesList.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 19/06/23.
//

import SwiftUI

struct BadgesList: View {
    let imagesNames: [String]

    @State var viewModel: GenericListViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {

            Text("Badges Relacionadas")
                .font(.body)
                .foregroundColor(.black)

            ScrollView(
                .horizontal,
                showsIndicators: false
            ) {
                badges().padding(80)
            }.padding(-80)
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
