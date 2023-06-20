//
//  ClassButton.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 20/06/23.
//

import SwiftUI

struct MenuButton: View {
    let title: String
    var font: Font? = .body

    var body: some View {
        HStack{
            Text(title)
                .foregroundColor(.black)
                .font(self.font ?? .body)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(self.font ?? .body)
        }
    }
}

struct ClassButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(title: "Turma 2022", font: .headline)
    }
}
