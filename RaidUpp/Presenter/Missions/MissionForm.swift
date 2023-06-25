//
//  GlobalForms.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 15/06/23.
//

import SwiftUI
import PhotosUI

struct MissionForm: View {

    // MARK: - Sheet Information
    var navigationTitle: String

    @State var firstField: String = ""
    @State var secondField: String = ""
    @State var thirdField: String = ""

    let possibleMissionLevels = ["Bronze", "Silver", "Gold", "Platinum"]

    @Binding var showingSheet: Bool


    var doneAction: (_ title: String, _ subtitle: String, _ level: String) -> Void

    var body: some View {
        NavigationStack {
            List {
                Section("Mission Title") {
                    TextField("Example: 100% Code Coverage", text: $firstField)
                }
                Section("Mission Details") {
                    TextField("Example: This is actually pretty much impossible!", text: $secondField)
                }
                Section("Guild") {
                    Picker("Mission Level", selection: $thirdField) {
                        ForEach(possibleMissionLevels, id: \.self) { level in
                            Button {
                                thirdField = level
                            } label: {
                                Text("\(level)")
                            }
                        }
                    }
                }
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        doneAction(firstField, secondField, thirdField)
                        showingSheet.toggle()
                    } label: {
                        Text("Done")
                    }.disabled(
                        firstField.isEmpty ||
                        secondField.isEmpty ||
                        thirdField.isEmpty 
                    )
                }
            }
        }
    }
}

struct MissionInfo: View {

    // MARK: - Sheet Information

    @Binding var showingSheet: Bool
    @Binding var hostMission: Mission

    var body: some View {
        NavigationStack {
            List {
                Section("Mission Title") {
                    Text(hostMission.title!)
                }
                Section("Mission Details") {
                    Text(hostMission.caption!)
                }
                Section("Mission Type") {
                    Text(hostMission.type!)
                }
            }
            .navigationTitle(hostMission.title!)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
