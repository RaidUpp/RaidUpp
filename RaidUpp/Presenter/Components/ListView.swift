//
//  ListView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 15/06/23.
//

import SwiftUI
import CoreData

struct ListView<Content: View, Banner: View>: View {

    // MARK: - List information
    var navigationTitle: String
    @State var showNextView: Bool = false

    // MARK: - Guests that will be iterated over when creating NavLinks
    var guests: [NSManagedObject]

    // MARK: - Closures for configuring
    var addAction: () -> Void
    @ViewBuilder var content: (_ value: NSManagedObject) -> Content
    var banner: (() -> Banner)?

    @State var searchText: String = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(guests, id: \.self) { obj in
                    if let managedObject = obj as? NSManagedObject {
                        NavigationLink("\(generateName(obj))") {
                            content(managedObject)
                        }
                    } else {
                        Text("Error data")
                            .task {
                                NSLog("Problem in obj: \(obj)")
                            }
                    }
                }
            }
            .navigationTitle(navigationTitle)
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer,
                        prompt: navigationTitle)
            .toolbar {
                Button {
                    addAction()
                }label: {
                    Image(systemName: "plus")
                        .font(.system(size: CGFloat(FontSizeEnum.small.rawValue)))
                }
            }
        }
    }
}


extension ListView {

    private func generateName(_ obj: NSObject) -> String {
        if let validatedObj = obj as? NSManagedObject {

            switch type(of: validatedObj) {
            case is Academy.Type:
                guard let academy = validatedObj as? Academy else { fatalError() }
                return "\(academy.title!): \(academy.years!)"

            case is Student.Type:
                guard let student = validatedObj as? Student else { fatalError() }
                return "\(student.title!)"

            case is Guild.Type:
                guard let guild = validatedObj as? Guild else { fatalError() }
                return "\(guild.title!)"

            case is Mission.Type:
                guard let mission = validatedObj as? Mission else { fatalError() }
                return "\(mission.title!)"

            default:
                return "🐛 - Could not find correct return type, returning default"
            }
        }
        return "🐛 - Could not validate object, returning default"
    }

}
