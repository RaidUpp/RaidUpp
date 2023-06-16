//
//  ClassView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 16/06/23.
//

import SwiftUI

struct ClassView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    StudentsView()
                } label: {
                    Text("Students")
                }
                NavigationLink {
                    GuildsView()
                } label: {
                    Text("Guilds")
                }
            }
            .navigationTitle("Class")
        }
    }
}

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView()
    }
}
