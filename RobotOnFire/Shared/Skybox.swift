//
//  Skybox.swift
//  RobotOnFire
//
//  Created by Berto, David Manuel  on 22/03/2024.
//

import Foundation
import RealityKit
import RealityKitContent

class Skybox {
    static var shared: Skybox = .init()
    
    func createSkybox() -> Entity? {
        // Create the skybox entity
        let skybox = Entity()
        
        // Create a spherical mesh
        let mesh = MeshResource.generateSphere(radius: 500)
        
        // Create an unlit material
        var material = UnlitMaterial()
        
        // Create a texture from the image you plan to use.
        // & set your material's color to a texture based on the image.
        // Use a do-try-catch, since the .load method may fail.
        do {
            let texture = try TextureResource.load(named: "video")
            material.color = .init(texture: .init(texture))
        } catch {
            print("Error loading texture: \(error)")
        }
        
        // Create a model out of your mesh & material.
        let model = ModelComponent(mesh: mesh, materials: [material])
        
        // Add the model to the entity's components.
        skybox.components.set(model)
        skybox.scale *= SIMD3(x: -1, y: 1, z: 1)
        
        // Return the skybox entity
        return skybox
    }
}
