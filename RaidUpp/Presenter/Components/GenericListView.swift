import SwiftUI
import CoreData

struct GenericListView: View {

    init<T: NSManagedObject>(_ entryPoint: T?) {
        if entryPoint != nil {
            self.viewModel = GenericListViewModel(entryPoint)
        } else {
            self.viewModel = GenericListViewModel(nil)
        }
    }

    @State var viewModel: GenericListViewModel

    @State var showingForm: Bool = false
    @State var searchText: String = ""

    var body: some View {
        NavigationStack {
            // TODO: - Construir a quantidade de listas específicas para as entidades convidadas
            List {
                ForEach(Array(viewModel.mainGuestEntities as Set), id: \.self) { obj in
                    NavigationLink (
                        // swiftlint:disable force_cast
                        "\(obj)", destination: GenericListView(obj as! NSManagedObject)
                        // swiftlint:enable force_cast
                    )
                }
            }
            .onChange(of: showingForm, perform: { _ in
                _ = refreshable {}
            })
            .navigationTitle(viewModel.listTitle)
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer,
                        prompt: "Find...")
            .toolbar {
                Button {
                    showingForm = true
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: CGFloat(FontSizeEnum.small.rawValue)))
                }
            }
            .sheet(isPresented: $showingForm) {
                GlobalForms(title: "Class", subtitle: "Year...", showingSheet: $showingForm) {title, subtitle in
                    viewModel.createEntity(guest: 0, title: title, subtitle: subtitle)
                }
//                GlobalForms(title: "Class", showingSheet: $showingForm, viewModel: $viewModel)
            }
        }
    }
}

//struct AgnosticListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AgnosticListView()
//    }
//}
