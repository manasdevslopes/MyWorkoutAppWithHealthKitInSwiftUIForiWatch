//
//  ActivityRingsView.swift
//  MyWorkouts WatchKit Extension
//
//  Created by MANAS VIJAYWARGIYA on 12/04/22.
//

import Foundation
import HealthKit
import SwiftUI

struct ActivityRingsView: WKInterfaceObjectRepresentable {
    typealias WKInterfaceObjectType = WKInterfaceObject
    
    let healthStore: HKHealthStore
    
    func makeWKInterfaceObject(context: Context) -> WKInterfaceObject {
        let activityRingsObject = WKInterfaceActivityRing()
        
        let calendar = Calendar.current
        var components = calendar.dateComponents([.era, .year, .month, .day], from: Date())
        components.calendar = calendar
        
        let predicate = HKQuery.predicateForActivitySummary(with: components)
        
        let query = HKActivitySummaryQuery(predicate: predicate) { query, summaries, error in
            DispatchQueue.main.async {
                activityRingsObject.setActivitySummary(summaries?.first, animated: true)
            }
        }
        
        healthStore.execute(query)
        
        return activityRingsObject
    }
    
    func updateWKInterfaceObject(_ wkInterfaceObject: WKInterfaceObject, context: Context) {
        
    }
}
