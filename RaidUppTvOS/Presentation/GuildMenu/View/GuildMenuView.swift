//
//  GuildMenuView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 16/06/23.
//

import SwiftUI

struct GuildMenuView: View {
    let guildType: String
    init(guildType: String) {
        self.guildType = guildType
    }
    
    var body: some View {
        ZStack {
            Image("background")
            VStack {
                Rectangle()
                    .foregroundColor(Color("gray-header"))
                    .frame(width: 1920, height: 380)
                    .ignoresSafeArea()
                Spacer()
            }
            
            HStack {
                GuildDetails(guild: self.guildType,
                             guildName: "Nome da guilda",
                             mentor: "Carolina Barbalho",
                             guildDescription: "teste")
                
                VStack(alignment: .leading, spacing: 36) {
                    Text(self.guildType.capitalized)
                        .font(.title2)
                        .padding(.bottom, 100)
                    
                    NavigationLink {
                        MissionBoardView(guild: self.guildType)
                    } label: {
                        Text("Missões")
                            .frame(width: 430, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                    .foregroundColor(Color("gray"))

                    NavigationLink {
                        BadgesView(
                            guild: self.guildType,
                            imagesNames: [
                                "bronze",
                                "gold",
                                "silver",
                                "silver",
                                "gold",
                                "bronze",
                                "bronze",
                                "gold",
                                "silver",
                                "silver",
                                "gold",
                                "bronze"
                            ]
                        )
                    } label: {
                        Text("Badges")
                            .frame(width: 430, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                    .foregroundColor(Color("gray"))
                    
                    Button(action: {}) {
                        Text("Participantes")
                            .frame(width: 430, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                    .foregroundColor(Color("gray"))
                    
                    Button(action: {}) {
                        Text("Calendário/Reuniões")
                            .frame(width: 430, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                    .foregroundColor(Color("gray"))
                    
                }
                .padding(.leading, 80)
            }
        }
    }
}

struct GuildMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GuildMenuView(guildType: "design")
    }
}