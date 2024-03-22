//
//  ImmersiveView.swift
//  RobotOnFire
//
//  Created by Berto, David Manuel  on 22/03/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent
import AVKit

struct ImmersiveView: View {
    
    @EnvironmentObject var globalState: GlobalState
    
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
            immersiveContentEntity.position = SIMD3(x: 0, y: 0.1, z: 0)
            immersiveContentEntity.scale = SIMD3(Size3D(width: 0.005, height: 0.005, depth: 0.005))
            addLights(immersiveContentEntity: immersiveContentEntity)
        }
    }
    
    private func addLights(immersiveContentEntity: Entity) {
        Task {
            // Add an ImageBasedLight for the immersive content
            guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
            let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.01)
            immersiveContentEntity.components.set(iblComponent)
            immersiveContentEntity.components.set(ImageBasedLightReceiverComponent(imageBasedLight: immersiveContentEntity))
        }
    }
    
   
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
}
