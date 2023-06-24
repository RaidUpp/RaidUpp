//
//  ParticipantsView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 22/06/23.
//

import SwiftUI

struct ParticipantsView: View {
    
    let participants: [[String]] = [
        ["participant-00", "participant-00", "participant-00", "participant-00", "participant-00"],
        ["participant-01", "participant-01", "participant-01", "participant-01", "participant-01"],
        ["participant-02", "participant-02", "participant-02", "participant-02", "participant-02"]
    ]
    
    @State private var selectedIndex: Int = 0
    @State private var isFocused: Bool = false
        
    @FocusState var selected: Int?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 32) {
                Button(action: {
                    self.selectedIndex = 0
                }) {
                    Text("Code")
                }
                .focused($selected, equals: 0)
                
                Button(action: {
                    self.selectedIndex = 1
                }) {
                    Text("Design")
                }
                .focused($selected, equals: 1)
                
                Button(action: {
                    self.selectedIndex = 2
                }) {
                    Text("Management")
                }
                .focused($selected, equals: 2)
            }
            .frame(width: 571, height: 278)
            .font(.body)
            .buttonStyle(.plain)
            .onChange(of: selected) { newValue in
                if let newValue {
                    selectedIndex = newValue
                    print(selectedIndex)
                }
            }
            
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    spacing: 50
                ) {
                    ForEach(participants[selectedIndex].indices, id: \.self) { index in
                        Button(action: {}) {
                            ParticipantButton(
                                imageName: participants[selectedIndex][index],
                                name: "daniele"
                            )
                        }.buttonStyle(.plain)
                    }
                }
            }
            
            Spacer()
        }
        .background {
            Image("background")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ParticipantsView_Previews: PreviewProvider {
    static var previews: some View {
        ParticipantsView()
    }
}
