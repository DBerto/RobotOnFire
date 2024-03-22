//
//  ImmersiveView.swift
//  RobotOnFire
//
//  Created by Berto, David Manuel  on 22/03/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    var body: some View {
        
        RealityView { content in
            // Add the initial RealityKit content
            if let skybox = Skybox.shared.createSkybox() {
                content.add(skybox)
            }
            
            guard let immersiveContentEntity = try? await Entity(named: "Bot", in: realityKitContentBundle) else {
                fatalError()
            }
            
            content.add(immersiveContentEntity)
            immersiveContentEntity.position = SIMD3(x: 0, y: 0, z: 0)
            addLights(immersiveContentEntity: immersiveContentEntity)
        }
    }
    
    private func addLights(immersiveContentEntity: Entity) {
        Task {
            // Add an ImageBasedLight for the immersive content
            guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
            let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.25)
            await immersiveContentEntity.components.set(iblComponent)
            await immersiveContentEntity.components.set(ImageBasedLightReceiverComponent(imageBasedLight: immersiveContentEntity))
        }
    }
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
}
