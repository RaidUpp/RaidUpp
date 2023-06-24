//
//  StudentListView.swift
//  RaidUpp
//
//  Created by Caio Soares on 23/06/23.
//

import SwiftUI
import CoreData

struct StudentListView<Content: View>: View {

    // MARK: - List information
    var navigationTitle: String

    // MARK: - Guests that will be iterated over when creating NavLinks
    var guests: NSSet

    var addAction: () -> Void

    @ViewBuilder var content: (_ value: NSManagedObject) -> Content

    @State var searchText: String = ""

    var body: some View {
        NavigationStack {
            
            
        }
    }
}

extension StudentListView {

    private func generateName(_ obj: NSObject) -> String {
        if let validatedObj = obj as? NSManagedObject {
            let name: String

            if let academyName = validatedObj as? Academy {
                return "\(academyName.title!): \(academyName.years!)"
            } else if let studentName = validatedObj as? Student {
                return "\(studentName.title!)"
            } else {
                return "🐛 - Could not find correct return type, returning default"
            }
        }

        return "🐛 - Could not validate object, returning default"
    }

}
