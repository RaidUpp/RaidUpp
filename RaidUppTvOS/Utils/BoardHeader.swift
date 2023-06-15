//
//  BoardHeader.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 15/06/23.
//

import SwiftUI

struct BoardHeader: View {
    let title: String
    let firstSubheadline: String
    let secondSubheadline: String
    
    init(title: String, firstSubheadline: String, secondSubheadline: String) {
        self.title = title
        self.firstSubheadline = firstSubheadline
        self.secondSubheadline = secondSubheadline
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(self.title)
                    .font(.title2)
                HStack(spacing: 20) {
                    Text(self.firstSubheadline)
                    Text("-")
                    Text(self.secondSubheadline)
                }
                .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.black)
            Button {
                print("calendario")
            } label: {
                Text("Calendar")
                    .font(.body)
            }
            Button {
                print("calendario")
            } label: {
                Text("Calendar")
                    .font(.body)
            }
        }
        .frame(width: 1739, height: 111)
    }
}

struct BoardHeader_Previews: PreviewProvider {
    static var previews: some View {
        BoardHeader(title: "Design", firstSubheadline: "Lorem ipsum dorem", secondSubheadline: "16 missões concluídas")
    }
}
