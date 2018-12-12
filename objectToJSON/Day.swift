//
//  Day.swift
//  GU Athletics Mindfulness
//
//  Created by Emma Delucchi on 12/2/18.
//  Copyright © 2018 Emma Delucchi. All rights reserved.
//

import Foundation

class Day: CustomStringConvertible{
    var name: String
    var hydration: Int
    var nutrition: Int
    var percievedStress: Int
    var fatigue: Int
    var overallReadinessScore: Double {
        return Double(percievedStress + nutrition +  hydration + fatigue)/4.0
    }
    var sleepHours: Int
    var date: Date
    
    
    var description: String{
        return "Hydration: \(hydration), Nutrition: \(nutrition), Percieved Stress: \(percievedStress), Fatigue: \(fatigue), Overall Readiness Score: \(overallReadinessScore)"
    }
    
    init(name: String, hydration: Int, nutrition: Int, percievedStress: Int, fatigue: Int, sleepHours: Int) {
        self.hydration = hydration
        self.nutrition = nutrition
        self.percievedStress = percievedStress
        self.fatigue = fatigue
        self.sleepHours = sleepHours
        self.date = Date()
        self.name = name
    }
}

