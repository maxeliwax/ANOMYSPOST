import SwiftUI

struct VideoDetailView: View {
    let video: Video
    @EnvironmentObject private var appModel: AppModel

    var body: some View {
        ScrollView {
            RoundedRectangle(cornerRadius: 16)
                .aspectRatio(9/16, contentMode: .fit)
                .overlay(
                    Image(systemName: "video.fill")
                        .font(.system(size: 48))
                        .opacity(0.6)
                )
                .padding()

            VStack(alignment: .leading, spacing: 8) {
                Text(video.title).font(.title2).bold()
                Text(video.caption).foregroundStyle(.secondary)

                HStack {
                    Label("\(Int(video.duration))s", systemImage: "clock")
                    Label("\(video.viewCount) visningar", systemImage: "eye")
                }
                .font(.footnote)
                .foregroundStyle(.secondary)

                NavigationLink {
                    CommentsView(video: video)
                } label: {
                    Label("Visa kommentarer", systemImage: "text.bubble")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 12)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Video")
        .navigationBarTitleDisplayMode(.inline)
    }
}
