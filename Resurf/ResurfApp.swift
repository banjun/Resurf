import SwiftUI
import RealityKit

@main
struct ResurfApp: SwiftUI.App {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace

    var body: some SwiftUI.Scene {
        WindowGroup {
            Button("Surf") { Task { await openImmersiveSpace(id: "I") }}
        }
        .windowResizability(.contentSize)

        ImmersiveSpace(id: "I") {
            RealityView { content in
                // resurf (respring) visionOS Simulator and Vision Pro
                let entity = Entity()
                entity.components.set(AnchoringComponent(.world(transform: .init()))) // use Transform.identity.matrix instead of .init(). it's the correct way.
                content.add(entity)
            }
        }
     }
}
