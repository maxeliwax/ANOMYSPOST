import Foundation

struct Video: Identifiable, Hashable {
    let id: UUID
    var title: String
    var caption: String
    var duration: TimeInterval
    var createdAt: Date
    var viewCount: Int

    init(id: UUID = UUID(),
         title: String,
         caption: String,
         duration: TimeInterval,
         createdAt: Date = .now,
         viewCount: Int = 0) {
        self.id = id
        self.title = title
        self.caption = caption
        self.duration = duration
        self.createdAt = createdAt
        self.viewCount = viewCount
    }
}
