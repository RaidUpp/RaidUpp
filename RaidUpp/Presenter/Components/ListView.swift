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

    @State var searchText: String = ""

    var guests: NSSet

    var addAction: () -> Void
    var content: (_ value: NSManagedObject) -> Content

    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(guests as Set), id: \.self) { obj in
                    NavigationLink("\(obj)") {
                        // swiftlint:disable force_cast
                        content(obj as! NSManagedObject)
                        // swiftlint:disable force_cast
                    }
                }
            }
//                        .onChange(of: showingForm, perform: { _ in
//                            _ = refreshable {}
//                        })
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
