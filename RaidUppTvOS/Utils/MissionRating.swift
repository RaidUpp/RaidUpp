//
//  MissionRating.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 16/06/23.
//

import SwiftUI

struct MissionRating: View {
    let rating: Int
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<5) { index in
                Image(systemName: index < rating ? "star.fill" : "star.fill")
                    .foregroundColor(index < rating ? .white : .white.opacity(0.5))
            }
        }
    }
}

struct MissionRating_Previews: PreviewProvider {
    static var previews: some View {
        MissionRating(rating: 4)
    }
}
