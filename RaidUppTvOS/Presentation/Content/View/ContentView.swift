//
//  ContentView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 13/06/23.
//

import SwiftUI

struct ContentView: View {
    let missionTypes: [MissionTypeImage] = [.bronze, .silver, .gold]
    let missionCount = 4
    
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
                GuildDetails(guild: "guilds",
                             guildName: "",
                             mentor: "Related Subtitle1",
                             guildDescription: "teste")
                VStack(alignment: .leading, spacing: 36) {
                    Text("Guildas")
                        .font(.title2)
                        .padding(.bottom, 100)
                    NavigationLink {
                        GuildMenuView(guildType: "code")
                    } label: {
                        Text("Programação")
                            .frame(width: 430, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                    NavigationLink {
                        GuildMenuView(guildType: "design")
                    } label: {
                        Text("Design")
                            .frame(width: 430, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                    NavigationLink {
                        GuildMenuView(guildType: "management")
                    } label: {
                        Text("Gestão")
                            .frame(width: 430, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.leading, 80)
                .padding(.bottom, 150)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
