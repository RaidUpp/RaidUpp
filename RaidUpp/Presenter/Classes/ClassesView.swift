//
//  ClassesView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 14/06/23.
//

import SwiftUI

struct ClassesView: View {
    @State var viewModel: GenericListViewModel
    @State var isShowForms: Bool = false

    var body: some View {
        ListView(title: "Classes", guests: viewModel.mainGuestEntities, addAction: {
            isShowForms.toggle()
        }, content: { obj in
            ClassView(viewModel: GenericListViewModel(obj))
        })
        .onChange(of: isShowForms, perform: { _ in
            _ = refreshable {}
        })
        .sheet(isPresented: $isShowForms) {
            GlobalForms(title: "Class", showingSheet: $isShowForms) { title, subtitle in
                viewModel.createAcademyEntity(title: title, subtitle: subtitle)
            }
        }
    }
}

//struct ClassesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClassesView()
//    }
//}
