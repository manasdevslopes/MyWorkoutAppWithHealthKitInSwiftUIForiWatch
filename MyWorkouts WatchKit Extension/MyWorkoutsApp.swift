//
//  MyWorkoutsApp.swift
//  MyWorkouts WatchKit Extension
//
//  Created by MANAS VIJAYWARGIYA on 12/04/22.
//

import SwiftUI

@main
struct MyWorkoutsApp: App {
    @StateObject var workoutManager = WorkoutManager()
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                StartView()
            }
            .sheet(isPresented: $workoutManager.showingSummaryView, content: {
                SummaryView()
            })
            .environmentObject(workoutManager)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
