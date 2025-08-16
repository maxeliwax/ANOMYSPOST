import SwiftUI

struct FeedView: View {
    @EnvironmentObject private var appModel: AppModel
    @StateObject private var vm: FeedViewModel

    init() {
        _vm = StateObject(wrappedValue: FeedViewModel(videoService: InMemoryVideoService.shared))
    }

    var body: some View {
        List(vm.videos) { video in
            NavigationLink(value: video) {
                VideoCardView(video: video)
            }
            .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        }
        .listStyle(.plain)
        .navigationDestination(for: Video.self) { video in
            VideoDetailView(video: video)
                .onAppear {
                    vm.recordView(of: video, appModel: appModel)
                }
        }
        .refreshable { vm.load() }
    }
}
