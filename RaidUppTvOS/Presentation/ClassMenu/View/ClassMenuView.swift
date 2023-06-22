//
//  ClassMenuView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 22/06/23.
//

import SwiftUI

struct ClassMenuView: View {
    
    @EnvironmentObject var entityFetcher: EntityFetcher
    let title: String
    
    var body: some View {
        GenericMenu(
            title: self.title,
            imageName: "class-image",
            imageTitle: self.title,
            imageSubtitle: "Subtitle",
            content: {
                MenuButton(title: "Guilds") {
                    GuildView().environmentObject(entityFetcher)
                }
                MenuButton(title: "Class missions") {
                }
                MenuButton(title: "Individual missions") {
                }
                MenuButton(title: "Participants") {
                }
            })
    }
}

struct ClassMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ClassMenuView(title: "Class 01").environmentObject(EntityFetcher())
    }
}
