//
//  ParticipantButton.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 23/06/23.
//

import SwiftUI

struct ParticipantButton: View {
    let imageName: String
    let name: String
    
    init(imageName: String, name: String) {
        self.imageName = imageName
        self.name = name
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Image(self.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            Text(self.name)
                .foregroundColor(.black)
        }
        .frame(width: 250, height: 292)
    }
}

struct ParticipantButton_Previews: PreviewProvider {
    static var previews: some View {
        ParticipantButton(imageName: "participant", name: "Daniele")
    }
}
