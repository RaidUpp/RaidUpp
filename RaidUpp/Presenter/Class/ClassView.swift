//
//  ClassView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 16/06/23.
//

import SwiftUI
import CoreData

struct ClassView: View {

    @State var viewModel: GenericListViewModel

    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    StudentsView(viewModel: GenericListViewModel(viewModel.hostEntity))
                } label: {
                    Text("Students")
                }
                NavigationLink {
                    EmptyView()
                } label: {
                    Text("Guilds")
                }
            }
            .navigationTitle("Class")
        }
    }
}

//struct ClassView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClassView()
//    }
//}
