//
//  ListView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 15/06/23.
//

import SwiftUI
import CoreData

struct ListView<Content: View>: View {
    var title: String
    var guests: NSSet
    var addAction: () -> Void
    var content: (_ value: NSManagedObject) -> Content

    @State var searchText: String = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(guests as Set), id: \.self) { obj in
                    if let managedObject = obj as? NSManagedObject {
                        NavigationLink("\(obj)") {
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
            .navigationTitle(title)
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer,
                        prompt: title)
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
//
//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView(title: "Global", addAction: {}, content: {value in
//            Text(value)
//        })
//    }
//}
