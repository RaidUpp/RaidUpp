//
//  MissionCard.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 14/06/23.
//

import SwiftUI


struct MissionCard: View {
    let image: Image
    let title: String
    let description: String
    
    init(image: Image, title: String, description: String) {
        self.image = image
        self.title = title
        self.description = description
    }
    
    var body: some View {
        
        HStack(spacing: 20) {
            ZStack {
                Color(uiColor: .white)
                    .frame(width: 200)
                    .opacity(0.8)
                self.image
            }
            // .border(.red)
            VStack(alignment: .leading, spacing: 20) {
                Text(self.title)
                    .foregroundColor(.black)
                    .font(.callout)
                Text(self.description)
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            .frame(maxWidth: 350, alignment: .leading)
            // .border(.black)
            Spacer()
        }
        .frame(width: 571, height: 178)
        .background(Color(.white).opacity(0.5))
        .cornerRadius(20)
    }
}

struct MissionCard_Previews: PreviewProvider {
    static var previews: some View {
        MissionCard(image: MissionTypeImage.bronze, title: "teste", description: "teste 2")
    }
}
