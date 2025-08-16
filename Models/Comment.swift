import Foundation

struct Comment: Identifiable, Hashable {
    let id: UUID
    let videoID: UUID
    var text: String
    var createdAt: Date

    init(id: UUID = UUID(),
         videoID: UUID,
         text: String,
         createdAt: Date = .now) {
        self.id = id
        self.videoID = videoID
        self.text = text
        self.createdAt = createdAt
    }
}
