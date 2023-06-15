//
//  ListView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 15/06/23.
//

import SwiftUI

struct ListView: View {
    var title: String

    @State var searchText: String = ""

    var addAction: () -> Void

    var body: some View {
        NavigationStack {
            List {
                Text(title)
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
        ListView(title: "Global", addAction: {})
    }
}
