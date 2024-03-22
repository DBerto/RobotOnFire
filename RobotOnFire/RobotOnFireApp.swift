//
//  RobotOnFireApp.swift
//  RobotOnFire
//
//  Created by Berto, David Manuel  on 22/03/2024.
//

import SwiftUI

@main
struct RobotOnFireApp: App {
        
    @ObservedObject var state = GlobalState()
    
    var body: some Scene {
        
        WindowGroup {
            Menu().environmentObject(state)
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView().environmentObject(state)
        }.immersionStyle(selection: .constant(.progressive), in: .progressive)
    }
}

class GlobalState: ObservableObject {
    @Published var showImmersiveSpace = false
    @Published var immersiveSpaceIsShown = false
}
