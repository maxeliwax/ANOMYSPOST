import Foundation

protocol VideoServicing {
    func fetchFeed() -> [Video]
    func incrementViews(for id: UUID)
}

@MainActor
final class InMemoryVideoService: VideoServicing {
    static let shared = InMemoryVideoService()

    private var videos: [Video]

    private init() {
        self.videos = [
            Video(title: "Sommarkväll", caption: "Havet i Nacka", duration: 23),
            Video(title: "Streetball", caption: "Snabb cross", duration: 17),
            Video(title: "Latte art", caption: "Så gör du ett hjärta", duration: 28)
        ]
    }

    func fetchFeed() -> [Video] {
        videos
    }

    func incrementViews(for id: UUID) {
        if let idx = videos.firstIndex(where: { $0.id == id }) {
            videos[idx].viewCount += 1
        }
    }
}
