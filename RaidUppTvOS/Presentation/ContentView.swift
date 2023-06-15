//
//  ContentView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 13/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    MissionCard(image: MissionTypeImage.bronze, title: "Mission title", description: "Mission description")
                    MissionCard(image: MissionTypeImage.bronze, title: "Mission title", description: "Mission description")
                    MissionCard(image: MissionTypeImage.bronze, title: "Mission title", description: "Mission description")
                }
            }
            ScrollView {
                HStack {
                    MissionCard(image: MissionTypeImage.silver, title: "Mission title", description: "Mission description")
                    MissionCard(image: MissionTypeImage.silver, title: "Mission title", description: "Mission description")
                    MissionCard(image: MissionTypeImage.silver, title: "Mission title", description: "Mission description")
                }
            }
            ScrollView {
                HStack {
                    MissionCard(image: MissionTypeImage.gold, title: "Mission title", description: "Mission description")
                    MissionCard(image: MissionTypeImage.gold, title: "Mission title", description: "Mission description")
                    MissionCard(image: MissionTypeImage.gold, title: "Mission title", description: "Mission description")
                }
            }
        }
        .background {
            Image("background")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
