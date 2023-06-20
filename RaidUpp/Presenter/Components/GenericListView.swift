import SwiftUI
import CoreData

struct GenericListView: View {

    init<T: NSManagedObject>(_ entryPoint: T?) {
        if entryPoint != nil {
            self.viewModel = ListViewModel(entryPoint)
        } else {
            self.viewModel = HomeViewModel(nil)
        }
    }

    @State var viewModel: ListViewModel
    @State var showingForm: Bool = false
    @State var searchText: String = ""

    var body: some View {
        NavigationStack {
            List {
                if viewModel.listTitle != "Test" {
                    ForEach(Array(viewModel.mainGuestEntities as Set), id: \.self) { obj in
                        NavigationLink (
                            // swiftlint:disable force_cast
                            "\(obj)", destination: GenericListView(obj as! NSManagedObject)
                            // swiftlint:enable force_cast
                        )
                    }
                }
            }
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
                GlobalForms(title: "Class", subtitle: "Year...", showingSheet: $showingForm) {title , subtitle in
                    viewModel.createEntity(guest: 0, title: title, subtitle: subtitle)
                }.onDisappear {

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
