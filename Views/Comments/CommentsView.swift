import SwiftUI

struct CommentsView: View {
    let video: Video
    @StateObject private var vm: CommentsViewModel

    init(video: Video) {
        self.video = video
        _vm = StateObject(
            wrappedValue: CommentsViewModel(
                videoID: video.id,
                commentService: InMemoryCommentService.shared
            )
        )
    }

    var body: some View {
        VStack(spacing: 0) {
            List {
                Section("Kommentarer (anonyma)") {
                    ForEach(vm.comments) { comment in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(comment.text)
                            Text(comment.createdAt.formatted(date: .abbreviated, time: .shortened))
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 2)
                    }
                }
            }
            .listStyle(.insetGrouped)

            Divider()

            HStack {
                TextField("Skriv en kommentar…", text: $vm.newCommentText)
                    .textFieldStyle(.roundedBorder)
                Button {
                    vm.send()
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .disabled(vm.newCommentText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            .padding(12)
            .background(.thinMaterial)
        }
        .navigationTitle("Kommentarer")
        .navigationBarTitleDisplayMode(.inline)
    }
}
