//
//  GuildsView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 15/06/23.
//

import SwiftUI

struct GuildsView: View {
    @State var viewModel: GenericListViewModel
    @State var isShowForms: Bool = false

    var body: some View {
        ListView(title: "Guilds", guests: viewModel.mainGuestEntities, addAction: {
            isShowForms.toggle()
        }, content: { obj in
            ClassView(viewModel: GenericListViewModel(obj))
        })
        .onChange(of: isShowForms, perform: { _ in
            _ = refreshable {}
        })
        .sheet(isPresented: $isShowForms) {
            GlobalForms(title: "Guild", showingSheet: $isShowForms) { title, subtitle in
                viewModel.createGuildEntity(title: title, subtitle: subtitle)
            }
        }
    }
}

//
//struct GuildsView_Previews: PreviewProvider {
//    static var previews: some View {
//        GuildsView()
//    }
//}
