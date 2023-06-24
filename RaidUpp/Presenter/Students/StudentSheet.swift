//
//  StudentSheet.swift
//  RaidUpp
//
//  Created by Caio Soares on 23/06/23.
//

import SwiftUI

struct StudentSheet: View {

    @Binding var hostEntity: Student
    @Binding var availableGuilds: NSSet
    @State var isShowingInfo: Bool = false
    @State private var selectedGuild = Guild()

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
                    Picker("", selection: $selectedGuild) {
                        ForEach(Array(availableGuilds as Set), id: \.self) { guild -> Text? in
                            if let validGuild = guild as? Guild {
                                return Text("\(validGuild.title!)")
                            }
                            return nil
                        }
                    }
                }
            }
            .onDisappear {
                print("🛠️ - Executed before closing Sheet")
            }
            .navigationTitle(hostEntity.title!)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible)
        }
    }
}
