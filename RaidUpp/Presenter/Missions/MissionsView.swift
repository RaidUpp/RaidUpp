//
//  MissionsView.swift
//  RaidUpp
//
//  Created by Caio Soares on 23/06/23.
//

import SwiftUI
import CoreData

struct MissionView: View {
    @State var viewModel: GenericListViewModel
    @State var isShowingForms: Bool = false

    var body: some View {
        ListView(navigationTitle: "Missions",
                 // swiftlint: disable force_cast
                 guests: Array(viewModel.guestEntities as! Set<NSManagedObject>).sorted
                 { ($0.value(forKey: "id") as? Int ?? 0) > ($1.value(forKey: "id") as? Int ?? 0) },
                 // swiftlint: enable force_cast
                 addAction: {
            isShowingForms.toggle()
        }, content: { obj in
            ClassView(viewModel: GenericListViewModel(obj))
        }, banner: {
            Color.blue
        })
        .onChange(of: isShowingForms, perform: { _ in
            _ = refreshable {}
        })
        .sheet(isPresented: $isShowingForms) {
            GlobalForms(navigationTitle: "Adding new Mission to Guild",
                        firstFormTitle: "Mission Title",
                        firstFormTextFieldTip: "Example: 100% Code Coverage!!",
                        secondFormTitle: "Mission Details",
                        secondFormTextFieldTip: "Example: This is actually impossible!",
                        showingSheet: $isShowingForms) { _, title, subtitle in
                // swiftlint: disable force_cast
                viewModel.createMissionInsideGuild(title: title, subtitle: subtitle, hostEntity: viewModel.hostEntity as! Guild)
                // swiftlint: enable force_cast
            }
        }
    }
}
