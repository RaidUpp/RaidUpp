//
//  StudentsView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 15/06/23.
//

import SwiftUI

struct StudentsView: View {
    @State var viewModel: GenericListViewModel
    @State var isShowForms: Bool = false

    var body: some View {
        ListView(title: "Students", guests: viewModel.mainGuestEntities, addAction: {
            isShowForms.toggle()
        }, content: { obj in
            ClassView(viewModel: GenericListViewModel(obj))
        })
        .onChange(of: isShowForms, perform: { _ in
            _ = refreshable {}
        })
        .sheet(isPresented: $isShowForms) {
            GlobalForms(title: "Student", showingSheet: $isShowForms) { title, subtitle in
                viewModel.createStudentEntity(title: title, subtitle: subtitle)
            }
        }
    }
}
