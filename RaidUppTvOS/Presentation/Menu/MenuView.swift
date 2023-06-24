//
//  MenuView.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 20/06/23.
//

import SwiftUI
import CoreData

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
                ForEach(Array(viewModel.guestEntities as Set), id: \.self) { entity in
                    MenuButton(title: "\(generateName(entity))") {
                        GuildView()
                    }.task {
                        print("🛠️ - Entities iterated over on menu view -> \(entity)")
                    }
                }
            }

        }.background(Image("background"))
    }
}

extension MenuView {

    private func generateName(_ obj: NSObject) -> String {
        if let validatedObj = obj as? NSManagedObject {
            let name: String

            if let academyName = validatedObj as? Academy {
                return "\(academyName.title!): \(academyName.years!)"
            } else if let studentName = validatedObj as? Student {
                return "\(studentName.title!)"
            } else {
                return "🐛 - Could not find correct return type, returning default"
            }
        }

        return "🐛 - Could not validate object, returning default"
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
