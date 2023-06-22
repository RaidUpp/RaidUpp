//
//  GenericMenu.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 21/06/23.
//

import SwiftUI

struct GenericMenu<Content: View>: View {
    let title: String
    let imageName: String
    var imageTitle: String = ""
    var imageSubtitle: String = ""
    var mentor: String = ""
    var hasBigButtons: Bool = false

    @ViewBuilder var content: () -> Content

    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .foregroundColor(Color("gray-header"))
                    .opacity(0.7)
                    .frame(width: 1920, height: 380)
                    .ignoresSafeArea()
                Spacer()
            }

            HStack(alignment: .top, spacing: 144){
                buildImageWithDescription()
                    .frame(width: 790, height: 742)

                buildList()
            }.padding(.top, 230)
        }.background(Image("background"))
    }

    private func buildImageWithDescription() -> some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .frame(width: 794, height: 530)
                .scaledToFill()
            Text(self.imageTitle)
                .font(.headline)
                .foregroundColor(.black)
            Text(self.imageSubtitle)
                .font(.subheadline)
                .foregroundColor(.black)
            Text(self.mentor)
                .font(.callout)
                .foregroundColor(.black).opacity(0.6)
            Spacer()
        }
    }

    private func buildList() -> some View {
            VStack(alignment: .leading, spacing: 100) {
                Text(self.title)
                    .font(.title2)
                    .foregroundColor(.black)
                VStack(alignment: .leading, spacing: 36) {
                    content()
                        .padding(.horizontal)
                }.frame(
                    width: 600,
                    height: 600,
                    alignment: .top
                )
            }    }
}

struct GenericMenu_Previews: PreviewProvider {
    static var previews: some View {
        GenericMenu(
            title: "Guilds",
            imageName: "design",
            imageTitle: "Nome personalizado",
            imageSubtitle: "Description of image",
            mentor: "Carolina Barbalho"
        ) {
            MenuButton(title: "Test") {}
        }
    }
}
