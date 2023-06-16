//
//  ListView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 15/06/23.
//

import SwiftUI

struct ListView<Content: View>: View {
    var title: String

    @State var searchText: String = ""
    @State var listObjects: [String] = ["Strdings", "Strings", "Strindgs"]

    var addAction: () -> Void
    var content: (_ value: String ) -> Content

    var body: some View {
        NavigationStack {
            List {
                ForEach(listObjects, id: \.self) { obj in
                    NavigationLink(obj,
                                   destination: content(obj)
                    )
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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(title: "Global", addAction: {}, content: {value in
            Text(value)
        })
    }
}
