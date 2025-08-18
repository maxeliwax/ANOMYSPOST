import SwiftUI
import AVKit
import AVFoundation

struct VideoDetailView: View {
    let video: Video

    var body: some View {
        GeometryReader { _ in
            ZStack(alignment: .bottomLeading) {
                let player = AVPlayer(url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)

                FullscreenVideoView(player: player)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .clipped()
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 8) {
                    Text(video.title)
                        .font(.title3).bold()
                    Text(video.caption)
                        .font(.subheadline)

                    HStack(spacing: 12) {
                        Label("\(Int(video.duration))s", systemImage: "clock")
                        Label("\(video.viewCount) visningar", systemImage: "eye")
                    }
                    .font(.caption)

                    NavigationLink {
                        CommentsView(video: video)
                    } label: {
                        Label("Visa kommentarer", systemImage: "text.bubble")
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(.white.opacity(0.9))
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                    .padding(.top, 4)
                }
                .padding()
                .foregroundColor(.white)
                .background(
                    LinearGradient(colors: [Color.black.opacity(0.8), .clear],
                                   startPoint: .bottom, endPoint: .top)
                        .ignoresSafeArea(edges: .bottom)
                )
            }
        }
        .background(Color.black)
        .ignoresSafeArea()
        .statusBar(hidden: true)
        .toolbar(.hidden, for: .tabBar)
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct FullscreenVideoView: UIViewRepresentable {
    let player: AVPlayer

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let layer = AVPlayerLayer(player: player)
        layer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(layer)
        context.coordinator.playerLayer = layer
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        context.coordinator.playerLayer?.player = player
        context.coordinator.playerLayer?.videoGravity = .resizeAspectFill
        context.coordinator.playerLayer?.frame = uiView.bounds
    }

    func makeCoordinator() -> Coordinator { Coordinator() }

    class Coordinator {
        var playerLayer: AVPlayerLayer?
    }

    static func dismantleUIView(_ uiView: UIView, coordinator: Coordinator) {
        coordinator.playerLayer?.player = nil
    }
}
