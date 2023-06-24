//
//  GuildsView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 15/06/23.
//

import SwiftUI

struct GuildsView: View {
    @State var viewModel: GenericListViewModel
    @State var isShowingForms: Bool = false

    var body: some View {
        ListView(navigationTitle: "Guilds", guests: viewModel.alternativeGuestEntities, addAction: {
            isShowingForms.toggle()
        }, content: { obj in
            MissionView(viewModel: GenericListViewModel(obj))
        }, banner: {
            Color.blue
        })
        .onChange(of: isShowingForms, perform: { _ in
            _ = refreshable {}
        })
        .sheet(isPresented: $isShowingForms) {
            GlobalForms(navigationTitle: "Creating new Guild",
                        firstFormTitle: "Guild Title",
                        firstFormTextFieldTip: "Example: Coding Guild!",
                        secondFormTitle: "Guild Subtitle",
                        secondFormTextFieldTip: "Example: Building Cool Stuff!",
                        showingSheet: $isShowingForms) { _, title, subtitle in
                viewModel.createGuildEntity(title: title, subtitle: subtitle)
            }
        }
    }
}

