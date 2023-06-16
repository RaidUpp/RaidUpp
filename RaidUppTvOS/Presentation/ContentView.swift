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
        VStack {
            BoardHeader(title: "Design", firstSubheadline: "Lorem ipsum dorem", secondSubheadline: "13 missões concluídas")
                .focusSection()
                .padding(.bottom, 20)
            VStack(spacing: 50) {
                ForEach(missionTypes, id: \.title) { missionType in
                    VStack {
                        Text("Missões \(missionType.title)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0..<missionCount) { _ in
                                    Button {
                                        
                                    } label: {
                                        MissionCard(image: missionType.image, title: "Mission title", description: "Mission description")
                                            .buttonStyle(.card)
                                    }
                                    .buttonStyle(.card)
                                }
                            }
                            .padding(80)
                        }
                        .padding(-80)
                    }
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
