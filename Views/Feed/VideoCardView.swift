
import SwiftUI
import AVKit
import AVFoundation

struct VideoCardView: View {
    let video: Video

    var body: some View {
        GeometryReader { _ in
            ZStack(alignment: .bottomLeading) {
                let player = AVPlayer(url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)

                // Fullscreen video layer
                FullscreenVideoView(player: player)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .clipped()
                    .ignoresSafeArea()

                // Overlays
                VStack(alignment: .leading, spacing: 8) {
                    Text(video.title)
                        .font(.headline)
                    Text(video.caption)
                        .font(.subheadline)
                        .lineLimit(2)

                    HStack(spacing: 12) {
                        Label("\(Int(video.duration))s", systemImage: "clock")
                        Label("\(video.viewCount) visningar", systemImage: "eye")
                    }
                    .font(.caption)
                }
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(colors: [Color.black.opacity(0.8), .clear],
                                   startPoint: .bottom, endPoint: .top)
                        .ignoresSafeArea(edges: .bottom)
                )
            }
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
}
