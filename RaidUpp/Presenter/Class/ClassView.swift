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
                    // swiftlint: disable force_cast
                    let availableGuilds = viewModel.fetchGuilds(viewModel.hostEntity as! Academy)
                    // swiftlint: enable force_cast
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
            .navigationTitle("Class")
        }
    }
}

//struct ClassView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClassView()
//    }
//}
