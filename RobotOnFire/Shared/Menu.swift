//
//  Menu.swift
//  RobotOnFire
//
//  Created by Mosca, Salvador Calainho on 22/03/2024.
//

import SwiftUI
import AVKit

struct Menu: View {
    
    @EnvironmentObject var globalState: GlobalState
    @State private var audioPlayer: AVAudioPlayer?
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        
        VStack {
            
            Button(!globalState.showImmersiveSpace ? "Go immersive" : "Exit") {
                Task {
                    if globalState.showImmersiveSpace {
                        globalState.showImmersiveSpace = false
                        await dismissImmersiveSpace()
                        
                    } else {
                        globalState.showImmersiveSpace = true
                        await openImmersiveSpace(id: "ImmersiveSpace")
                    }
                }
            }
            
            Button("Dance") {
                
            }
            
            Button("Say something") {
                if !(audioPlayer?.isPlaying ?? false) {
                    audioPlayer?.play()
                } else {
                    audioPlayer?.stop()
                }
            }
            
            Button("Do the barrel roll") {
                
            }
            
            Button("Ouch") {
                
            }
        }.task {
            prepareSound()
        }
    }
    
    private func prepareSound() {
    
        guard let path = Bundle.main.path(forResource: "sea_sounds", ofType: "aiff") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        } catch {
            print("Error loading audio file: \(error)")
        }
    }
}

#Preview {
    Menu()
}
