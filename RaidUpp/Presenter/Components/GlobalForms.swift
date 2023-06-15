//
//  GlobalForms.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 15/06/23.
//

import SwiftUI

struct GlobalForms: View {
    var title: String

    @State var nameTitle: String = ""

    var doneAction: () -> Void

    var body: some View {
        NavigationStack {
            List {
                Section("Name \(title)") {
                    TextField("Name \(title)", text: $nameTitle)
                }
                Section("Imagem") {
                    Button {

                    }label: {
                        Button {
                            capturePicture()
                        } label: {
                            Text("Take a picture")
                                .foregroundColor(.orange)
                        }

                    }

                    NavigationLink(destination: ClassesView(), label: {
                        Text("From Gallery")
                    })
                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(width: 222, height: 242, alignment: .center)
                            .foregroundColor(.gray)
                            .padding(16)
                        Spacer()
                    }
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        cancelForm()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }

                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        doneAction()
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
    }
}

extension GlobalForms {
    private func cancelForm() {

    }

    private func capturePicture() {

    }
}

struct GlobalForms_Previews: PreviewProvider {
    static var previews: some View {
        GlobalForms(title: "Global", doneAction: {

        })
    }
}
