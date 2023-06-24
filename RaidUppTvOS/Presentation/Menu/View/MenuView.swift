//
//  MenuView.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 20/06/23.
//

import SwiftUI


struct MenuView: View {

    @State var viewModel: GenericListViewModel

    var body: some View {
        HStack(spacing: 255) {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(
                    width: 580,
                    height: 320
                )

            VStack {
                Text("Classes")
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
                ForEach(Array(viewModel.mainGuestEntities as Set), id: \.self) { entity in
                    MenuButton(title: "\(getNameForObj(entity))") {
                        GuildView()
                    }
                }
            }

        }.background(Image("background"))
    }
}


/*

     private func buildClassesList() -> some View {
         return ForEach(Array(arrayLiteral: viewModel.mainGuestEntities as Set), id: \.self) { entity in
             Emp
                MenuButton(
                    title: "\(String(describing: entity))"
                        title: classesList[entity]
                ) {
                        ClassMenuView(title: String(describing: entity)).environmentObject(entityFetcher)
             }
         }
     }
 }

 struct MenuView_Previews: PreviewProvider {
     static var previews: some View {
         MenuView(classesList: [
             "Turma 2022",
             "Turma 2020",
             "Turma 2018",
             "Turma 2016",
             "Turma 2014"
         ])
            MenuView()
     }
 }

 */
