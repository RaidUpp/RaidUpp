//
//  ClassesView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 14/06/23.
//

import SwiftUI

struct ClassesView: View {
    @State var isShowForms: Bool = false

    var body: some View {
        ListView(title: "Classes", addAction: {
            isShowForms.toggle()
        })
        .sheet(isPresented: $isShowForms) {
            GlobalForms(title: "Class") {
            }
        }
    }
}

struct ClassesView_Previews: PreviewProvider {
    static var previews: some View {
        ClassesView()
    }
}
