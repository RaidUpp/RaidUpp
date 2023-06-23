//
//  ParticipantsView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 22/06/23.
//

import SwiftUI

struct ParticipantsView: View {
    @State private var selectedIndex: Int = 0
    @State private var isFocused: Bool = false
    
    @FocusState var selected: Int?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Button(action: {
                    //self.selectedIndex = 0
                }) {
                    Text("Opção 1")
                }
                .buttonStyle(.plain)
                .focused($selected, equals: 0)
                
                Button(action: {
                    //self.selectedIndex = 1
                }) {
                    Text("Opção 2")
                }
                .buttonStyle(.plain)
                .focused($selected, equals: 1)
                
                Button(action: {
                    //self.selectedIndex = 2
                }) {
                    Text("Opção 3")
                }
                .buttonStyle(.plain)
                .focused($selected, equals: 2)
            }
            
            VStack(alignment: .leading) {
                if let selected {
                    Text("Conteúdo \(selected + 1)")
                } else {
                    Text("Passa o controle por cima de um botão")
                }
            }

            Spacer()
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
