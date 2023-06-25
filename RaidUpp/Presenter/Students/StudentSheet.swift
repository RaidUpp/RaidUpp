//
//  StudentSheet.swift
//  RaidUpp
//
//  Created by Caio Soares on 23/06/23.
//

import SwiftUI

struct StudentSheet: View {

    @Binding var hostEntity: Student
    @Binding var isShowingInfo: Bool

    var availableGuilds: [Guild]

    @State var selectedGuild = Guild()

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
                Section("Guild") {
                    Picker("\(hostEntity.title!)'s Guild", selection: $selectedGuild) {
                        ForEach(availableGuilds, id: \.self) { guild in
                            Button {
                                selectedGuild = guild
                            } label: {
                                Text("\(guild.title!)")
                            }
                        }.task {
                            print("🛠️ - Currently Select Guild - \(selectedGuild)")
                        }
                    }
                }
            }
            .navigationTitle(hostEntity.title!)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible)
            .toolbar {
                Button {
                    print("🛠️ - Trying to save with selected guild being \(selectedGuild)")
                    if !availableGuilds.isEmpty {
                        saveEdits(hostEntity, selectedGuild)
                    }
                    isShowingInfo.toggle()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}
