//
//  StartView.swift
//  MyWorkouts WatchKit Extension
//
//  Created by MANAS VIJAYWARGIYA on 12/04/22.
//

import SwiftUI
import HealthKit

struct StartView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    
    var workoutTypes: [HKWorkoutActivityType] = [.cycling, .running, .walking]
    
    var body: some View {
        List(workoutTypes) { workoutType in
            NavigationLink(
                workoutType.name,
                destination: SessionPagingView(),
                tag: workoutType,
                selection: $workoutManager.selectedWorkout
            )
                .padding(
                    EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5)
                )
        }
        .listStyle(.carousel)
        .navigationBarTitle("Workouts")
        .onAppear {
            workoutManager.requestAuthorization()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject(WorkoutManager())
    }
}

extension HKWorkoutActivityType: Identifiable {
    public var id: UInt {
        rawValue
    }
    
    var name: String {
        switch self {
        case .cycling:
            return "Bike"
        case .running:
            return "Run"
        case .walking:
            return "Walk"
        default:
            return ""
        }
    }
}
