//
//  GuildDetails.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 16/06/23.
//

import SwiftUI

struct MenuImageWithDescription: View {
    let imageName: String
    var title: String = ""
    var subtitle: String = ""
    var mentor: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .frame(width: 794, height: 530)
                .scaledToFill()
            Text(self.title)
                .font(.headline)
                .foregroundColor(.black)
            Text(self.subtitle)
                .font(.subheadline)
                .foregroundColor(.black)
            Text(self.mentor)
                .font(.callout)
                .foregroundColor(.black).opacity(0.6)
        }
        .frame(width: 790, height: 742)
//        .padding(.bottom, -78)
    }
}

struct MenuImageWithDescription_Previews: PreviewProvider {
    static var previews: some View {
        MenuImageWithDescription(
            imageName: "design",
            title: "Nome personalizado",
            subtitle: "Description of image",
            mentor: "Carolina Barbalho"
        )
    }
}
