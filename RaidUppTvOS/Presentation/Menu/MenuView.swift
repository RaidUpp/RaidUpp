//
//  MenuView.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 20/06/23.
//

import SwiftUI
import CoreData

struct MenuView: View {

    @State var viewModel: GenericListViewModel

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
                ScrollView(showsIndicators: false) {
                    Spacer()
                    ForEach(Array(viewModel.guestEntities as Set), id: \.self) { entity in

                        MenuButton(title: "\(EntityName.generateName(entity))") {
                            ClassMenuView(
                                viewModel: GenericListViewModel(entity as? Academy)
                            )
                        }.task {
                            print("🛠️ - Entities iterated over on menu view -> \(entity)")
                        }.padding(.horizontal, 20)
                    }
                    Spacer()
                }
                .frame(height: 450)
            }

        }.background(Image("background"))
    }
}
