//
//  StudentsView.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 15/06/23.
//

import SwiftUI
import CoreData

struct StudentsView: View {
    @State var viewModel: GenericListViewModel
    @State var isShowingForms: Bool = false
    @State var isShowingInfo: Bool = false
    @State var targetStudent = Student()
    @State var searchText: String = ""
    
    var navigationTitle: String

    var body: some View {
        List {
            ForEach(Array(viewModel.guestEntities as Set), id: \.self) { obj in
                Button {
                    print("🛠️ - Casting \(obj) as Student")
                    guard let validatedStudent: Student = obj as? Student else { fatalError() }
                    targetStudent = validatedStudent
                    isShowingInfo.toggle()
                } label: {
//                    Label("uh", systemImage: "plus")
                    Text("\(generateName(obj))").foregroundColor(.black)
                }

            }
        }
        .navigationTitle(navigationTitle)
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer,
                    prompt: navigationTitle)
        .toolbar {
            Button {
                isShowingForms.toggle()
            }label: {
                Image(systemName: "plus")
                    .font(.system(size: CGFloat(FontSizeEnum.small.rawValue)))
            }
        }
        .onChange(of: isShowingForms, perform: { _ in
            _ = refreshable {}
        })
        .sheet(isPresented: $isShowingForms) {
            GlobalForms(navigationTitle: "Adding new Student to Academy",
                        firstFormTitle: "Student Name",
                        firstFormTextFieldTip: "Example: Ping Pongerson!",
                        secondFormTitle: "Notes about Student",
                        secondFormTextFieldTip: "Example: He's a goof ball",
                        showingSheet: $isShowingForms) { _, title, subtitle in
                viewModel.createStudentEntity(title: title, subtitle: subtitle)
            }
        }
        .sheet(isPresented: $isShowingInfo) {
            StudentSheet(hostEntity: $targetStudent,
                         isShowingInfo: $isShowingInfo,
                         // swiftlint: disable force_cast
                         availableGuilds: Array(viewModel.alternativeGuestEntities as! Set<Guild>).sorted { $0.title! > $1.title! }) { student, guild in
                         // swiftlint: enable force_cast
                viewModel.saveEditsTo(student, guild)
            }
        }
    }
}

extension StudentsView {

    private func generateName(_ obj: NSObject) -> String {
        if let validatedObj = obj as? NSManagedObject {
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
