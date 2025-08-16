import SwiftUI

struct VideoCardView: View {
    let video: Video

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 72, height: 96)
                .overlay(Image(systemName: "play.fill").opacity(0.6))

            VStack(alignment: .leading, spacing: 4) {
                Text(video.title).font(.headline)
                Text(video.caption)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)

                HStack(spacing: 12) {
                    Label("\(Int(video.duration))s", systemImage: "clock")
                    Label("\(video.viewCount)", systemImage: "eye")
                }
                .font(.caption)
                .foregroundStyle(.secondary)
            }
            Spacer()
        }
    }
}
