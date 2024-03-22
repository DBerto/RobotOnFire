//
//  Menu.swift
//  RobotOnFire
//
//  Created by Mosca, Salvador Calainho on 22/03/2024.
//

import SwiftUI

struct Menu: View {
    
    @EnvironmentObject var globalState: GlobalState
    
    
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
                
            }
            
            Button("Do the barrel roll") {
                
            }
            
            Button("Ouch") {
                
            }
        }
    }
}

#Preview {
    Menu()
}
