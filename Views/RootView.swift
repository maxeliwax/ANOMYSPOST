import SwiftUI

struct RootView: View {
    @EnvironmentObject private var appModel: AppModel

    var body: some View {
        TabView {
            NavigationStack {
                FeedView()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .tabItem { Label("Feed", systemImage: "play.rectangle.fill") }

            NavigationStack {
                Text("Lägg upp – placeholder")
                    .padding()
                    .navigationTitle("Lägg upp")
            }
            .tabItem { Label("Lägg upp", systemImage: "plus.square.on.square") }
        }
    }
}
