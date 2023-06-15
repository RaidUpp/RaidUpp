//
//  ClassesView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 14/06/23.
//

import SwiftUI

struct ClassesView: View {

    var body: some View {
       ListView(title: "Class", addAction: {})
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
