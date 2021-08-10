//
//  LandmarksApp.swift
//  WatchLandmarks Extension
//
//  Created by 木下健一 on 2021/08/10.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
