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
    @State var isShowingInfo: Bool = false
    @State var isShowingForm: Bool = false

    @State var targetMission = Mission()
    @State var searchText: String = ""

    var body: some View {
        List {
            ForEach(Array(viewModel.guestEntities as Set).sorted
            { ($0.value(forKey: "title") as? String ?? "debug") < ($1.value(forKey: "title") as? String ?? "debug") },
            id: \.self) { obj in
                Button {
                    print("🛠️ - Casting \(obj) as Student")
                    guard let validatedMission: Mission = obj as? Mission else { fatalError() }
                    targetMission = validatedMission
                    isShowingInfo.toggle()
                } label: {
                    Text("\(generateName(obj))").foregroundColor(.black)
                }

            }
        }
        .navigationTitle("Missions")
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer,
                    prompt: "Missions")
        .toolbar {
            Button {
                isShowingForm.toggle()
            }label: {
                Image(systemName: "plus")
                    .font(.system(size: CGFloat(FontSizeEnum.small.rawValue)))
            }
        }
        .onChange(of: isShowingForm, perform: { _ in
            _ = refreshable {}
        })
        .sheet(isPresented: $isShowingForm) {
            MissionForm(navigationTitle: "Adding new Mission to Guild",
                        showingSheet: $isShowingForm) { title, subtitle, level in
                // swiftlint: disable force_cast
                viewModel.createMissionInsideGuild(title: title, subtitle: subtitle, level: level, hostEntity: viewModel.hostEntity as! Guild)
                // swiftlint: enable force_cast
            }
        }
        .sheet(isPresented: $isShowingInfo) {
            MissionInfo(showingSheet: $isShowingInfo, hostMission: $targetMission)
        }
    }
}

extension MissionView {

    private func generateName(_ obj: NSObject) -> String {
        if let validatedObj = obj as? NSManagedObject {
            if let mission = validatedObj as? Mission {
                return "\(mission.title!): \(mission.caption!)"
            } else {
                return "🐛 - Could not find correct return type, returning default"
            }
        }

        return "🐛 - Could not validate object, returning default"
    }

}
