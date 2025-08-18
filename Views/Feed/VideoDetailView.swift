import SwiftUI

struct VideoDetailView: View {
    let video: Video
    @EnvironmentObject private var appModel: AppModel

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.black)
                .overlay(
                    Image(systemName: "video.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.white.opacity(0.6))
                )
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
}
