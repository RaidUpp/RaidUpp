//
//  ClassButton.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 20/06/23.
//

import SwiftUI


struct MenuButton<Destination: View> : View {
    let title: String
    var font: Font? = .headline

    @ViewBuilder var destination: () -> Destination

    var body: some View {
        NavigationLink {
            destination()
        } label: {
            HStack {
                Text(title)
                    .foregroundColor(.black)
                    .font(self.font ?? .body)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(self.font ?? .body)
            }
        }
        .buttonStyle(.plain)
    }
}

struct ClassButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(title: "Turma 2022", font: .headline) {
            GuildView().environmentObject(EntityFetcher())
        }
    }
}
