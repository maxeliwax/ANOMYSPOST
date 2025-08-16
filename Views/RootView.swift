import SwiftUI

struct RootView: View {
    @EnvironmentObject private var appModel: AppModel

    var body: some View {
        TabView {
            NavigationStack {
                FeedView()
                    .navigationTitle("AnonClips")
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            VStack(spacing: 2) {
                                Text("AnonClips").font(.headline)
                                Text("Mina visningar: \(appModel.totalViews)")
                                    .font(.caption2).foregroundStyle(.secondary)
                            }
                        }
                    }
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
