//
//  Skybox.swift
//  RobotOnFire
//
//  Created by Berto, David Manuel  on 22/03/2024.
//

import Foundation
import SwiftUI
import RealityKit
import RealityKitContent
import AVFoundation

class Skybox {
    static var shared: Skybox = .init()
    let player = AVPlayer()
    var playerItem: AVPlayerItem?

    func createSkybox() -> Entity? {
        // Create the skybox entity
        let videoEntity = Entity()

        // Create a spherical mesh
        let mesh = MeshResource.generateSphere(radius: 500)

        // Create a texture from the image you plan to use.
        // & set your material's color to a texture based on the image.
        // Use a do-try-catch, since the .load method may fail.
        //Search for video in paths
        let url = Bundle.main.url(forResource: "video", withExtension: "mp4")!
        
        //create a simple AVPlayer
        let asset = AVURLAsset(url: url)
        let playerItem = AVPlayerItem(asset: asset)
        //create a videoMaterial
        let material = VideoMaterial(avPlayer: player)
        
        //Made a Sphere with the videoEntity and asign the videoMaterial to it
        videoEntity.components.set(ModelComponent(mesh: mesh, materials: [material]))
        
        //adjust the properties of the videoEntity(Sphere) if needed
        videoEntity.scale = .init(x: 0.1, y: 0.1, z: -0.1)
        videoEntity.transform.translation += SIMD3<Float>(0.0, 10.0, 0.0)
        
        let angle = Angle.degrees(90)
        let rotation = simd_quatf(angle: Float(angle.radians), axis: .init(x: 0, y: 0, z: 0))
        
        videoEntity.transform.rotation = rotation
        
        //start the VideoPlayer
        player.replaceCurrentItem(with: playerItem)
        player.play()
        
        // Return the skybox entity
        return videoEntity
    }
}
