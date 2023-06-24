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
                    let viewModel = GenericListViewModel(viewModel.hostEntity)
                    StudentsView(viewModel: viewModel, navigationTitle: "Students")
                } label: {
                    Text("Students")
                }
                NavigationLink {
                    let viewModel = GenericListViewModel(viewModel.hostEntity)
                    GuildsView(viewModel: viewModel)
                    
                } label: {
                    Text("Guilds")
                }
            }
            .navigationTitle("\(viewModel.listTitle)")
        }
    }
}

//struct ClassView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClassView()
//    }
//}
