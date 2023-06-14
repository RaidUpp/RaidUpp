//
//  FormClass.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 14/06/23.
//

import SwiftUI

struct FormClass: View {
    @State var nameClass: String = ""
    var body: some View {
        NavigationStack {
            List {
                Section("Name Class") {
                    TextField("Name Class", text: $nameClass)
                }
                Section("Imagem") {
                    Button {

                    }label: {
                        Text("Take a picture")
                            .foregroundColor(.orange)
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
            .navigationTitle("Class")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {

                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }

                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {

                    } label: {
                        Text("Done")
                    }
                }

            }
        }
    }
}

struct FormClass_Previews: PreviewProvider {
    static var previews: some View {
        FormClass()
    }
}
