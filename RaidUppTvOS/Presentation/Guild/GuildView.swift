//
//  ContentView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 13/06/23.
//

import SwiftUI
import CoreData

struct GuildView: View {

    @State var viewModel: GenericListViewModel

    var body: some View {
        GenericMenu(
            title: "Guilds",
            imageName: "guilds"
        ) {
            ForEach(
                // swiftlint: disable force_cast
                Array(viewModel.alternativeGuestEntities as! Set<NSManagedObject>).sorted{
                    ($0.value(forKey: "id") as? Int ?? 0) > ($1.value(forKey: "id") as? Int ?? 0)
                },
                // swiftlint: enable force_cast
                id: \.self
            ) { entity in

                MenuButton(title: "\(EntityName.generateName(entity))") {
                    GuildMenuView(viewModel: GenericListViewModel(entity as? Guild))
                }.task {
                    print("🛠️ - Entities iterated over on menu view -> \(entity)")
                }.padding(.horizontal, 20)
            }


        }.task {
            print("🛠️ Host entity -> \(viewModel.hostEntity)")
        }
    }
}
