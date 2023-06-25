//
//  StudentSheet.swift
//  RaidUpp
//
//  Created by Caio Soares on 23/06/23.
//

import SwiftUI
import CoreData

struct StudentSheet: View {

    @Binding var hostEntity: Student
    @Binding var isShowingInfo: Bool

    var availableGuilds: [Guild]

    @State var selectedGuild = Guild()

    var saveEdits: (_ student: Student, _ chosenGuild: Guild) -> Void
    var markMissionAsComplete: (_ student: Student, _ mission: Mission) -> Void
    var markMissionAsUncomplete: (_ student: Student, _ mission: Mission) -> Void

    @State var refresher: Bool = false

    var body: some View {
        NavigationStack {
            List {
                Section("Student Name") {
                    Text("\(hostEntity.title!)")
                }
                Section("Student Notes") {
                    Text("\(hostEntity.subtitle!)")
                }
                if availableGuilds.isEmpty == false {
                    Section("Guild") {
                        Picker("\(hostEntity.title!)'s Guild", selection: $selectedGuild) {
                            ForEach(availableGuilds, id: \.self) { guild in
                                Button {
                                    selectedGuild = guild
                                    refresher.toggle()
                                } label: {
                                    Text("\(guild.title!)")
                                }
                            }
                        }
                    }
                    .onAppear {
                        if hostEntity.guild != nil {
                            selectedGuild = hostEntity.guild!
                        }
                    }
                }
                Section("Achievements") {
                    ForEach(getAchievements(), id: \.self) { mission in
                        Button {
                            markMissionAsUncomplete(hostEntity, mission)
                            refresher.toggle()
                        } label: {
                            Text("\(generateNameForMission(mission))")
                                .foregroundColor(generateColorForMission(mission))
                        }
                    }
                }
                Section("Uncompleted Missions") {
                    ForEach(getLockedAchievements(), id: \.self) { mission in
                        Button {
                            markMissionAsComplete(hostEntity, mission)
                            refresher.toggle()
                        } label: {
                            Text("\(generateNameForMission(mission))")
                                .foregroundColor(generateColorForMission(mission))
                        }
                    }
                }
            }
            .onChange(of: refresher, perform: { _ in
                _ = refreshable {}
            })
            .navigationTitle(hostEntity.title!)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible)
            .toolbar {
                Button {
                    print("🛠️ - Trying to save with selected guild being \(selectedGuild.title!)")
                    if availableGuilds.isEmpty == false || hostEntity.guild != nil {
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

extension StudentSheet {

    private func getAchievements() -> [Mission] {
        if let achievements = hostEntity.achievement as? Set<Mission> {
            let achievedMissions = Array(achievements)
            return achievedMissions.sorted { mission1, mission2 in
                let typeOrder: [String] = ["platinum", "gold", "silver", "bronze"]
                guard let index1 = typeOrder.firstIndex(of: mission1.type!),
                      let index2 = typeOrder.firstIndex(of: mission2.type!) else {
                    // Handle the case when either mission1 or mission2 has an unrecognized type
                    return false // Or choose a custom sorting behavior
                }
                return index1 > index2
            }
        }
        return []
    }

    private func getLockedAchievements() -> [Mission] {
        var availableMissions = [Mission]()

        // Get all missions associated with completed achievements
        let completedMissions = getAchievements()

        // Fetch all available missions from the guild
        if let hostGuild = hostEntity.guild,
           let guildMissions = hostGuild.guildMission as? Set<Mission> {
            let allMissions = Array(guildMissions)

            // Filter out missions that are completed
            availableMissions = allMissions.filter { mission in
                !completedMissions.contains(mission)
            }
        }

        return availableMissions
    }

    private func generateNameForMission(_ obj: Mission) -> String {
        return "\(obj.title!): \(obj.caption!)"
    }

    private func generateColorForMission(_ obj: Mission) -> Color {
        switch obj.type?.lowercased() {
        case "bronze":
            return .brown
        case "silver":
            return .gray
        case "gold":
            return .yellow
        case "platinum":
            return .mint
        default:
            return .black
        }
    }

}
