import SwiftUI

@MainActor
final class AppModel: ObservableObject {
    let videoService: VideoServicing
    let commentService: CommentServicing

    @Published var totalViews: Int = 0  // Privat total-views för skaparen

    init(videoService: VideoServicing = InMemoryVideoService.shared,
         commentService: CommentServicing = InMemoryCommentService.shared) {
        self.videoService = videoService
        self.commentService = commentService
    }
}
