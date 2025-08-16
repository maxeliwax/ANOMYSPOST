import Foundation

@MainActor
final class CommentsViewModel: ObservableObject {
    @Published private(set) var comments: [Comment] = []
    @Published var newCommentText: String = ""

    private let videoID: UUID
    private let commentService: CommentServicing

    init(videoID: UUID, commentService: CommentServicing) {
        self.videoID = videoID
        self.commentService = commentService
        load()
    }

    func load() {
        comments = commentService.fetchComments(for: videoID)
    }

    func send() {
        let text = newCommentText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }
        _ = commentService.addComment(text, to: videoID)
        newCommentText = ""
        load()
    }
}
