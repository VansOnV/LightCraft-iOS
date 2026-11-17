import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var pickerItem: PhotosPickerItem?
    @State private var original: Data?
    @State private var image: UIImage?
    @State private var exposure: Float = 0

    var body: some View {
        VStack(spacing: 16) {
            Text(engineVersion()).font(.caption).foregroundStyle(.secondary)

            if let image {
                Image(uiImage: image).resizable().scaledToFit()
            } else {
                Spacer()
                Text("Pick a photo to start")
            }

            VStack(alignment: .leading) {
                Text("Exposure \(exposure, specifier: "%.2f")")
                Slider(value: $exposure, in: -3...3)
                    .onChange(of: exposure) { _ in render() }
            }
            .padding(.horizontal)

            PhotosPicker("Choose photo", selection: $pickerItem, matching: .images)
                .buttonStyle(.borderedProminent)
        }
        .padding()
        .onChange(of: pickerItem) { item in
            Task {
                original = try? await item?.loadTransferable(type: Data.self)
                render()
            }
        }
    }

    private func render() {
        guard let original else { return }
        let out = processImage(data: original, exposure: exposure)
        image = UIImage(data: out)
    }
}
