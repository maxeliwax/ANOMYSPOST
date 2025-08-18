import SwiftUI

struct FeedView: View {
    @EnvironmentObject private var appModel: AppModel
    @StateObject private var vm: FeedViewModel

    init() {
        _vm = StateObject(wrappedValue: FeedViewModel(videoService: InMemoryVideoService.shared))
    }

    var body: some View {
        GeometryReader { proxy in
            TabView {
                ForEach(vm.videos) { video in
                    VideoDetailView(video: video)
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        .rotationEffect(.degrees(-90))
                        .onAppear {
                            vm.recordView(of: video, appModel: appModel)
                        }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: proxy.size.height, height: proxy.size.width)
            .rotationEffect(.degrees(90), anchor: .topLeading)
            .offset(x: proxy.size.width)
            .ignoresSafeArea()
        }
        .onAppear { vm.load() }
    }
}
