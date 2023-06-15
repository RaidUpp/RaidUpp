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
            BoardHeader(title: "Design", firstSubheadline: "Lorem ipsum dorem", secondSubheadline: "13 missões concluídas")
                .focusSection()
            VStack(spacing: 75) {
                VStack {
                    Text("Missões bronze")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                    ScrollView(.horizontal) {
                        HStack {
                            Button {
                                
                            } label: {
                                MissionCard(image: MissionTypeImage.bronze, title: "Mission title", description: "Mission description")
                            }
                            .buttonStyle(.card)
                            Button {
                                
                            } label: {
                                MissionCard(image: MissionTypeImage.bronze, title: "Mission title", description: "Mission description")
                            }
                            .buttonStyle(.card)
                            Button {
                                
                            } label: {
                                MissionCard(image: MissionTypeImage.bronze, title: "Mission title", description: "Mission description")
                            }
                            .buttonStyle(.card)
                            Button {
                                
                            } label: {
                                MissionCard(image: MissionTypeImage.bronze, title: "Mission title", description: "Mission description")
                            }
                            .buttonStyle(.card)
                        }
                        .padding(.vertical, 20)
                    }
                }
                VStack {
                    Text("Missões prata")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                    ScrollView(.horizontal) {
                        HStack {
                            Button {
                                
                            } label: {
                                MissionCard(image: MissionTypeImage.silver, title: "Mission title", description: "Mission description")
                            }
                            .buttonStyle(.card)
                            Button {
                                
                            } label: {
                                MissionCard(image: MissionTypeImage.silver, title: "Mission title", description: "Mission description")
                            }
                            .buttonStyle(.card)
                            Button {
                                
                            } label: {
                                MissionCard(image: MissionTypeImage.silver, title: "Mission title", description: "Mission description")
                            }
                            .buttonStyle(.card)
                            Button {
                                
                            } label: {
                                MissionCard(image: MissionTypeImage.silver, title: "Mission title", description: "Mission description")
                            }
                            .buttonStyle(.card)
                        }
                    }
                }
                .focusSection()
                VStack {
                    Text("Missões ouro")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                    ScrollView(.horizontal) {
                        HStack {
                            Button {
                                
                            } label: {
                                MissionCard(image: MissionTypeImage.bronze, title: "Mission title", description: "Mission description")
                            }
                            .buttonStyle(.card)
                            Button {
                                
                            } label: {
                                MissionCard(image: MissionTypeImage.bronze, title: "Mission title", description: "Mission description")
                            }
                            .buttonStyle(.card)
                            Button {
                                
                            } label: {
                                MissionCard(image: MissionTypeImage.bronze, title: "Mission title", description: "Mission description")
                            }
                            .buttonStyle(.card)
                            Button {
                                
                            } label: {
                                MissionCard(image: MissionTypeImage.bronze, title: "Mission title", description: "Mission description")
                            }
                            .buttonStyle(.card)
                        }
                    }
                }
            }
            .focusSection()
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
