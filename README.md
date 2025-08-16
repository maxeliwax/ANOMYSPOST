# AnonClips — Anonymous Short-Video App (iOS)

A minimal, privacy-first short-video app inspired by TikTok—without social pressure. No public profiles, no followers, no DMs. Everyone consumes a **For You** feed. Creators only see a private **Total Views** counter across all their videos. Comments are fully anonymous.

---

## ✨ Core Features

* **For You feed** with swipeable short videos (15–60s).
* **Anonymity by design:** no public handles, followers, likes, or DMs.
* **Private analytics:** creator-only total views (no per-video public stats).
* **Anonymous comments:** post and read comments without exposing identity.
* **Simple moderation hooks:** placeholders for report/remove workflows.

---

## 📱 Tech Stack

* **Language:** Swift (Swift 5.9+)
* **UI:** SwiftUI
* **Media:** AVKit/AVFoundation
* **State:** ObservableObject, Combine/Swift Concurrency
* **iOS:** 17.0+

> Backend is abstracted behind lightweight service protocols so you can plug in Firebase, Supabase, or your own API.

---

## 🧱 Project Structure

```
AnonClips/
├─ AnonClipsApp.swift
├─ AppModel.swift
├─ Models/
│  ├─ Video.swift
│  └─ Comment.swift
├─ Services/
│  ├─ VideoService.swift
│  └─ CommentService.swift
├─ ViewModels/
│  ├─ FeedViewModel.swift
│  └─ CommentsViewModel.swift
└─ Views/
   ├─ RootView.swift
   ├─ Feed/
   │  ├─ FeedView.swift
   │  ├─ VideoCardView.swift
   │  └─ VideoDetailView.swift
   └─ Comments/
      └─ CommentsView.swift
```

---

## 🧰 Model Sketches (conceptual)

```swift
// Video.swift
struct Video: Identifiable, Codable {
    let id: String
    let url: URL
    let caption: String?
    let createdAt: Date
    let totalViews: Int // only shown privately to the owner
}

// Comment.swift
struct Comment: Identifiable, Codable {
    let id: String
    let videoId: String
    let text: String
    let createdAt: Date
    // No user identifiers by design
}
```

---

## 🔌 Service Contracts (swap any backend)

```swift
// VideoService.swift
protocol VideoService {
    func fetchFeed() async throws -> [Video]
    func upload(videoData: Data, caption: String?) async throws
    func incrementViewCount(videoId: String) async throws
}

// CommentService.swift
protocol CommentService {
    func fetchComments(videoId: String) async throws -> [Comment]
    func postComment(videoId: String, text: String) async throws
}
```

---

## 🚀 Getting Started

1. **Requirements:** Xcode 15+, iOS 17+.
2. **Clone:** `git clone https://github.com/<your-org>/AnonClips.git`
3. **Open:** `AnonClips.xcodeproj` (or `.xcworkspace` if you add packages).
4. **Run:** Select a simulator (e.g., iPhone 15) → **Run** (⌘R).

### Optional Configuration

* If you integrate a backend, add required keys (e.g., `GoogleService-Info.plist` for Firebase) and wire it in `AppModel` via your `VideoService`/`CommentService` implementation.

---

## 🧭 App Flow

* **RootView** boots the app and routes to **FeedView**.
* **FeedView** shows the swipeable feed via **VideoCardView**.
* **VideoDetailView** displays the video with an **anonymous CommentsView**.
* **FeedViewModel** / **CommentsViewModel** coordinate data via services.

---

## 🔒 Privacy & Safety

* No public identifiers, follower graphs, or DMs.
* Comments are anonymous; moderation hooks included for reports/removal.
* Extend with on-device checks, content filters, rate limiting, and abuse prevention as needed.

---

## 🗺️ Roadmap

* Offline caching & prefetching
* Reporting pipeline & admin tools
* Automatic captions & accessibility improvements
* HLS/streaming optimizations
* Push notifications (opt-in)

---

## 🤝 Contributing

Issues and PRs are welcome. Please:

* Keep PRs focused and well-described.
* Add lightweight tests where possible.
* Follow Swift API Design Guidelines.

---

## 📄 License

MIT — see `LICENSE` for details.

---

## 📷 Screenshots

Add your images to `Docs/` and reference them here:

```md
![Feed](Docs/feed.png)
![Comments](Docs/comments.png)
```

---

**Repository description (short):**

> A privacy-first iOS short-video app with an anonymous “For You” feed, no followers/DMs, private total views for creators, and fully anonymous comments. Built with SwiftUI + AVKit.
