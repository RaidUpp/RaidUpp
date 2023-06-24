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
    var guests: NSSet

    // MARK: - Closures for configuring
    var addAction: () -> Void
    @ViewBuilder var content: (_ value: NSManagedObject) -> Content
    var banner: (() -> Banner)?

    @State var searchText: String = ""


    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(guests as Set), id: \.self) { obj in
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

    public func getNameForObj(_ obj: NSObject) -> String {
        guard let validatedObj = obj as? NSManagedObject else { fatalError() }
        switch type(of: validatedObj) {
        case is Academy.Type:
            guard let academyName: Academy = validatedObj as? Academy else { fatalError() }
            return "\(academyName.title!): \(academyName.years!)"
        case is Student.Type:
            guard let studentName: Student = validatedObj as? Student else { fatalError() }
            return "\(studentName.title!)"
        default:
            return "🐛 - Something went wrong, returning default string"
        }
    }

}

//
//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView(title: "Global", addAction: {}, content: {value in
//            Text(value)
//        })
//    }
//}
