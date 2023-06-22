//
//  MenuView.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 20/06/23.
//

import SwiftUI

struct MenuView: View {
    var classesList: [String]

    @StateObject var entityFetcher = EntityFetcher()

    var body: some View {
        HStack(spacing: 255) {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(
                    width: 580,
                    height: 320
                )

            VStack {
                Text("Classes")
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
                buildClassesList()
            }

        }.background(Image("background"))
    }

    private func buildClassesList() -> some View {
        return ForEach(
            classesList.indices,
//            Array(entityFetcher.entities as Set),
            id: \.self
        ) { entity in
            MenuButton(
//                title: String(describing: entity),
                title: classesList[entity],
                font: .headline,
                isBigButton: true
            ) {
                GuildView().environmentObject(entityFetcher)
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(classesList: [
            "Turma 2022",
            "Turma 2020",
            "Turma 2018",
            "Turma 2016",
            "Turma 2014"
        ])
//        MenuView()
    }
}
