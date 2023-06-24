//
//  ClassesView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 14/06/23.
//

import SwiftUI

struct AcademyView: View {
    @State var viewModel: GenericListViewModel
    @State var isShowForms: Bool = false

    var body: some View {
        ListView(navigationTitle: "Classes", guests: viewModel.guestEntities, addAction: {
            isShowForms.toggle()
        }, content: { obj in
            ClassView(viewModel: GenericListViewModel(obj))
        }, banner: {
            Image("Logo")
                .padding(.all)
        })
        .onChange(of: isShowForms, perform: { _ in
            _ = refreshable {}
        })
        .sheet(isPresented: $isShowForms) {
            GlobalForms(navigationTitle: "Creating new Academy Class",
                        firstFormTitle: "Academy Title",
                        firstFormTextFieldTip: "Example: Cool Fortaleza Academy!",
                        secondFormTitle: "Active Years",
                        secondFormTextFieldTip: "Example: 2022-2023",
                        showingSheet: $isShowForms) { _, title, subtitle in
                viewModel.createAcademyEntity(title: title, subtitle: subtitle)
            }
        }
    }
}
