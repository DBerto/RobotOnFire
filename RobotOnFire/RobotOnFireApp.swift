//
//  RobotOnFireApp.swift
//  RobotOnFire
//
//  Created by Berto, David Manuel  on 22/03/2024.
//

import SwiftUI

@main
struct RobotOnFireApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
