//
//  ClassesView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 14/06/23.
//

import SwiftUI
import CoreData

struct AcademyView: View {
    @State var viewModel: GenericListViewModel
    @State var isShowingForms: Bool = false

    var body: some View {
        ListView(navigationTitle: "Academies",
                 // swiftlint: disable force_cast
                 guests: Array(viewModel.guestEntities as! Set<NSManagedObject>).sorted
                 { ($0.value(forKey: "years") as? String ?? "debug") > ($1.value(forKey: "years") as? String ?? "debug") },
                 // swiftlint: enable force_cast
                 addAction: {
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
