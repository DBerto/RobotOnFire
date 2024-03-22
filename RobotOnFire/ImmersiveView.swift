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
            guard let immersiveContentEntity = try? await Entity(named: "Robot", in: realityKitContentBundle) else {
                fatalError()
            }
            
            content.add(immersiveContentEntity)
            immersiveContentEntity.position = SIMD3(x: 0, y: 0, z: 0)
            immersiveContentEntity.scale = SIMD3(Size3D(width: 1, height: 1, depth: 1))
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
