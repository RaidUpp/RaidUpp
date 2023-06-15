//
//  ClassesView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 14/06/23.
//

import SwiftUI

struct ClassesView: View {
    @State var searchText: String = ""

    var body: some View {
        NavigationStack {
            List {
                Text("Moyses")
            }
            .navigationTitle("Classes")
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer,
                        prompt: "classes")
            .toolbar {
                Button {
                    addClass()
                }label: {
                    Image(systemName: "plus")
                        .font(.system(size: CGFloat(FontSizeEnum.small.rawValue)))
                }
            }
        }
    }
}

extension ClassesView {
    private func addClass() {

    }
}

struct ClassesView_Previews: PreviewProvider {
    static var previews: some View {
        ClassesView()
    }
}
