//
//  StudentSheet.swift
//  RaidUpp
//
//  Created by Caio Soares on 23/06/23.
//

import SwiftUI

struct StudentSheet: View {

    @Binding var hostEntity: Student
    @State var isShowingInfo: Bool = false
    @State private var selectedGuild = "None"

    var doneAction: (_ child: Int, _ title: String, _ subtitle: String) -> Void

    var body: some View {
        NavigationStack {
            List {
                Section("Student Name") {
                    Text("\(hostEntity.title!)")
                }
                Section("Student Notes") {
                    Text("\(hostEntity.subtitle!)")
                }
                Section("Guild") {
//                    Picker("", selection: selectedGuild) {
//
//                    }
                }
            }.onAppear {
                print("🛠️ - Host Entity Name \(hostEntity.title!)")
            }
            .navigationTitle(hostEntity.title!)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible)
        }
    }
}
