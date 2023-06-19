//
//  GuildDetails.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 16/06/23.
//

import SwiftUI

struct GuildDetails: View {
    let guild: String
    let guildName: String
    let mentor: String
    let guildDescription: String
    
    init(guild: String, guildName: String, mentor: String, guildDescription: String) {
        self.guild = guild
        self.guildName = guildName
        self.mentor = mentor
        self.guildDescription = guildDescription
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(guild)
                .resizable()
                .frame(width: 794, height: 530)
                .scaledToFill()
            Text(self.guildName)
                .font(.headline)
                .foregroundColor(.black)
            Text(self.mentor)
                .font(.callout)
                .foregroundColor(.gray)
            Text(self.guildDescription)
                .font(.body)
                .foregroundColor(.gray)
        }
        .frame(width: 790, height: 742)
        .padding(.bottom, -78)
    }
}

struct GuildDetails_Previews: PreviewProvider {
    static var previews: some View {
        GuildDetails(guild: "design", guildName: "Nome personalizado", mentor: "Carolina Barbalho", guildDescription: "A guilda valoriza a experimentação e encoraja seus membros a explorarem novas abordagens, técnicas e soluções inovadoras no campo do design. O objetivo é impulsionar a criatividade e estimular o pensamento fora da caixa, resultando em projetos originais e impactantes.")
    }
}
