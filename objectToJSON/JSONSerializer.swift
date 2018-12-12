//
//  JSONSerializer.swift
//  GU Athletics Mindfulness
//
//  Created by Emma Delucchi on 12/10/18.
//  Copyright © 2018 Emma Delucchi. All rights reserved.
//

import Foundation

class JSONSerializer{
    var jsonString: String
    var jsonObject: Data
    
    init(_ dayCollection: DayCollection) {
        jsonString = "{"
        
        //1
        jsonString.append("\"chart\": {\"caption\": \"Your Weekly Performance\",\"subcaption\": \"Week of 11/26\",\"xaxisname\": \"Scores\",\"yaxisname\": \"Ratings You've Given\",\"formatnumberscale\": \"1\",\"plottooltext\": \"You gave a <b>$dataValue</b> for <b>$seriesName</b> on $label\",\"theme\": \"fusion\",\"drawcrossline\": \"1\"},")
        
        //2
        jsonString.append("\"categories\":[{\"category\":[")
        for date in dayCollection.days{
            jsonString.append("{\"label\":\"" + date.name + "\"},")
        }
        jsonString.removeLast()//backtrack the last comma
        jsonString.append("]}],")
        
        //3
        jsonString.append("\"dataset\":[")
        
        //Nutrition
        jsonString.append("{\"seriesname\": " + "\"Nutrition" + "\",\"data\": [")
        for date in dayCollection.days{
            jsonString.append("{\"value\": \"" + String(date.nutrition) + "\"},")
        }
        jsonString.removeLast()//backtrack the last comma
        jsonString.append("]},")
        
        //Hydration
        jsonString.append("{\"seriesname\": " + "\"Hydration" + "\",\"data\": [")
        for date in dayCollection.days{
            jsonString.append("{\"value\": \"" + String(date.hydration) + "\"},")
        }
        jsonString.removeLast()//backtrack the last comma
        jsonString.append("]},")
        
        //Percieved Stress
        jsonString.append("{\"seriesname\": " + "\"Percieved Stress" + "\",\"data\": [")
        for date in dayCollection.days{
            jsonString.append("{\"value\": \"" + String(date.percievedStress) + "\"},")
        }
        jsonString.removeLast()//backtrack the last comma
        jsonString.append("]},")
        
        //Fatigue
        jsonString.append("{\"seriesname\": " + "\"Fatigue" + "\",\"data\": [")
        for date in dayCollection.days{
            jsonString.append("{\"value\": \"" + String(date.fatigue) + "\"},")
        }
        jsonString.removeLast()//backtrack the last comma
        jsonString.append("]},")
        
        //Sleep Hours
        jsonString.append("{\"seriesname\": " + "\"Hours of Sleep" + "\",\"data\": [")
        for date in dayCollection.days{
            jsonString.append("{\"value\": \"" + String(date.sleepHours) + "\"},")
        }
        jsonString.removeLast()//backtrack the last comma
        jsonString.append("]},")
        
        //Overall Readiness Score
        jsonString.append("{\"seriesname\": " + "\"Overall Readiness Score" + "\",\"data\": [")
        for date in dayCollection.days{
            jsonString.append("{\"value\": \"" + String(date.overallReadinessScore) + "\"},")
        }
        jsonString.removeLast()//backtrack the last comma
        jsonString.append("]}") // no comma at end
        
        
        jsonString.append("]}")
        
        print(jsonString)
        
        jsonObject = jsonString.data(using: .utf8)!
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: jsonObject, options : .allowFragments) as? [String:Any]
            {
                print("Success!")
            } else {
                print("bad json")
            }
        } catch let error as NSError {
            print(error)
        }
    }

}
