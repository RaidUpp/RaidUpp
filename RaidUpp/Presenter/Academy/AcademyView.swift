//
//  ClassesView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 14/06/23.
//

import SwiftUI

struct AcademyView: View {
    @State var viewModel: GenericListViewModel
    @State var isShowingForms: Bool = false

    var body: some View {
        ListView(navigationTitle: "Academies", guests: viewModel.guestEntities, addAction: {
            isShowingForms.toggle() // Allows the list to pop open the sheet if needed
        }, content: { obj in
            ClassView(viewModel: GenericListViewModel(obj)) // NextView in the Stack
        }, banner: {
            Image("Logo")
                .padding(.all)
        })
        .onChange(of: isShowingForms, perform: { _ in
            _ = refreshable {}
        })
        .sheet(isPresented: $isShowingForms) {
            GlobalForms(navigationTitle: "Creating new Academy Class",
                        firstFormTitle: "Academy Title",
                        firstFormTextFieldTip: "Example: Cool Fortaleza Academy!",
                        secondFormTitle: "Active Years",
                        secondFormTextFieldTip: "Example: 2022-2023",
                        showingSheet: $isShowingForms) { _, title, subtitle in
                viewModel.createAcademyEntity(title: title, subtitle: subtitle)
            }
        }

        NavigationLink(destination: EmptyView(), label: {})
    }
}
