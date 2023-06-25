//
//  MissionSheet.swift
//  RaidUpp
//
//  Created by Caio Soares on 24/06/23.
//

import SwiftUI

struct MissionSheet: View {
    
    var navigationTitle: String

    @Binding var hostEntity: Guild
    @Binding var isShowingInfo: Bool

    var saveEdits: (_ student: Student, _ chosenGuild: Guild) -> Void

    var body: some View {
        NavigationStack {
            List {
                Section("Student Name") {
                    Text("\(hostEntity.title!)")
                }
                Section("Student Notes") {
                    Text("\(hostEntity.subtitle!)")
                }
            }
            .navigationTitle(hostEntity.title!)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible)
            .toolbar {
                Button {
                    print("🛠️ - Creating mission")
                    print("🛠️ - Creating badge to match mission")
                    isShowingInfo.toggle()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}
