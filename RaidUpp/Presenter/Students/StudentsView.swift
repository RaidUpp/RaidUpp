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
        }, content: {value in 
            EmptyView()
        })
        .sheet(isPresented: $isShowForms) {
            GlobalForms(title: "Student", showingSheet: $isShowForms) { title, subtitle in
                viewModel.creaateAcademyEntity(title: title, subtitle: subtitle)
            }
        }
    }
}
