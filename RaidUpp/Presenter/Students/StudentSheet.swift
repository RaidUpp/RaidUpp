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
    var updateMissionStatus: (_ student: Student, _ mission: Mission) -> Void

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
                        }
                    }
                }
                Section("Achievements") {
                    ForEach(getAchievements(), id: \.self) { achiev in
                        Text(achiev.caption!)
                    }
                }
                Section("Uncompleted Missions") {
                    ForEach(getLockedAchievements(), id: \.self) { mission in
                        Button {
                            updateMissionStatus(hostEntity, mission)
                        } label: {
                            Text("\(generateNameForMission(mission))")
                                .foregroundColor(generateColorForMission(mission))
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
                    if !availableGuilds.isEmpty || !selectedGuild.isFault {
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

    private func getAchievements() -> [Badge] {
        if let achievements = hostEntity.achievement as? Set<Badge> {
            let achievedBadges = Array(achievements)
            return achievedBadges
        }
        return []
    }

    private func getMissionsFromBadges() -> [Mission] {
        var missions = [Mission]()
        for achievs in getAchievements() {
            missions.append(achievs.mission!)
        }
        return missions
    }

    private func getLockedAchievements() -> [Mission] {
        var availableMissions = [Mission]()

        // Get all missions associated with completed achievements
        let completedMissions = getMissionsFromBadges()

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
