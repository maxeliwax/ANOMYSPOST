import Foundation

protocol CommentServicing {
    func fetchComments(for videoID: UUID) -> [Comment]
    func addComment(_ text: String, to videoID: UUID) -> Comment
}

@MainActor
final class InMemoryCommentService: CommentServicing {
    static let shared = InMemoryCommentService()

    private var store: [UUID: [Comment]] = [:]

    private init() {}

    func fetchComments(for videoID: UUID) -> [Comment] {
        store[videoID, default: []].sorted { $0.createdAt < $1.createdAt }
    }

    func addComment(_ text: String, to videoID: UUID) -> Comment {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let comment = Comment(videoID: videoID, text: trimmed)
        store[videoID, default: []].append(comment)
        return comment
    }
}
