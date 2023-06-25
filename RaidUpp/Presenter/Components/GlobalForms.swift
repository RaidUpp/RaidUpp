//
//  GlobalForms.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 15/06/23.
//

import SwiftUI
import PhotosUI

struct GlobalForms: View {

    // MARK: - Sheet Information
    var navigationTitle: String
    var firstFormTitle: String
    var firstFormTextFieldTip: String

    var secondFormTitle: String
    var secondFormTextFieldTip: String

    @State var whichChild = Int()
    @State var firstField: String = ""
    @State var secondField: String = ""
//    @State var selectedItems: [PhotosPickerItem] = []
//    @State var data: Data?

    @Binding var showingSheet: Bool


    var doneAction: (_ child: Int, _ title: String, _ subtitle: String) -> Void

    var body: some View {
        NavigationStack {
            List {
                Section("\(firstFormTitle)") {
                    TextField("\(firstFormTextFieldTip)", text: $firstField)
                }
                Section("\(secondFormTitle)") {
                    TextField("\(secondFormTextFieldTip)", text: $secondField)
                }
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        doneAction(whichChild, firstField, secondField)
                        showingSheet.toggle()
                    } label: {
                        Text("Done")
                    }.disabled(
                        firstField.isEmpty ||
                        secondField.isEmpty ||
                        navigationTitle == "Creating new Academy Class" && secondField.count < 9
                    )
                }
            }
        }
    }
}
