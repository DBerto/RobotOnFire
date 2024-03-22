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
            Menu()
                .environmentObject(state)
        }.defaultSize(CGSize(width: 200, height: 500))

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView().environmentObject(state)
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}

class GlobalState: ObservableObject {
    @Published var showImmersiveSpace = false
    @Published var startDancing = false
    @Published var doTheBarrelRoll = false
    @Published var burnIt = false
    @Published var saySomething = false
}
