//
//  ViewController.swift
//  objectToJSON
//
//  Created by Emma Delucchi on 12/10/18.
//  Copyright © 2018 Emma Delucchi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    var json: String
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = WKWebView()
        let htmlPath = Bundle.main.path(forResource: "chart", ofType: "html")
        print(htmlPath!)
        let htmlUrl = URL(fileURLWithPath: htmlPath!, isDirectory: false)
        //webView.loadFileURL(htmlUrl, allowingReadAccessTo: htmlUrl)
        //view = webView
        webView.navigationDelegate = self
        
        //Test for Day class
        var day1 = Day(name: "Monday", hydration: 2, nutrition: 4, percievedStress: 3, fatigue: 3, sleepHours: 8)
        var day2 = Day(name: "Tuesday", hydration: 2, nutrition: 5, percievedStress: 5, fatigue: 3, sleepHours: 6)
        var day3 = Day(name: "Wednesday", hydration: 4, nutrition: 5, percievedStress: 1, fatigue: 4, sleepHours: 9)
        var days = DayCollection()
        days.appendDay(day1)
        days.appendDay(day2)
        days.appendDay(day3)
        var jsonSerializer = JSONSerializer(days)
        json = jsonSerializer.jsonString
        passInJSON(json: json)
        
        webView.loadFileURL(htmlUrl, allowingReadAccessTo: htmlUrl)
        view = webView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
    
    func passInJSON(json: String){
        print("What is in this JSON? \(json)")
        self.webView.evaluateJavaScript("updateJSON(\(json))") { result, error in
            guard error == nil else {
                print(error)
                return
            }
        }
    }


}

//Update HTML file after the JSON is set
//How to call JS function embemmed  in HTML from swift

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finished navigating to url \(webView.url)")
        
        webView.evaluateJavaScript("updateJSON(\(json))") { (any, error) in
            dump(error)
            print(any)
        }
        
    }
}
