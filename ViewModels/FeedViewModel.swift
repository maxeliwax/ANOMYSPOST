import Foundation

@MainActor
final class FeedViewModel: ObservableObject {
    @Published private(set) var videos: [Video] = []
    private let videoService: VideoServicing

    init(videoService: VideoServicing) {
        self.videoService = videoService
        load()
    }

    func load() {
        videos = videoService.fetchFeed()
    }

    func recordView(of video: Video, appModel: AppModel) {
        videoService.incrementViews(for: video.id)
        appModel.totalViews += 1
        load()
    }
}
