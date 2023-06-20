//
//  GlobalForms.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 15/06/23.
//

import SwiftUI
import PhotosUI

struct GlobalForms: View {
    var title: String

    @State var nameTitle: String = ""
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?

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
                    PhotosPicker(selection: $selectedItems,
                                 maxSelectionCount: 1
                    ) {
                        Text("From Gallery")
                    }
                    .onChange(of: selectedItems, perform: { _ in
                        guard let item = selectedItems.first else {
                            return
                        }

                        item.loadTransferable(type: Data.self) { result in
                            switch result {
                            case .success(let data):
                                if let data = data {
                                    self.data = data
                                } else {
                                    print("Data is nil")
                                }
                            case .failure(let failure):
                                fatalError("\(failure)")
                            }
                        }
                    })

                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(width: 222, height: 242, alignment: .center)
                            .foregroundColor(.gray)
                            .padding(16)
                            .overlay {
                                if let data = data, let uiImage = UIImage(data: data
                                ) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                }
                            }
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
