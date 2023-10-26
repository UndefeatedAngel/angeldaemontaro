//
//  UIVIewController+Analytics.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 26.10.23.
//

import UIKit
import FirebaseAnalytics

extension UIViewController {
    func setUserId(id: String) {
        print("[ANALYTICS] UserId: " + id)
        
        Analytics.setUserID(id)
    }
    
    func logScreen(screenName: String, screenClass: String) {
        //print("[ANALYTICS] Screen: " + screenName + " Class: " + screenClass)
        
        Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: screenName,
                                        AnalyticsParameterScreenClass: screenClass])
    }
    
    func logEventClick(title: String, item: String) {
        logEvent(title: title + "_click", item: item, type: "click")
    }
    
    func logEvent(title: String, item: String, type: String) {
        print("[ANALYTICS] Title: " + title + " Item: " + item + " Type: " + type)
        
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
          AnalyticsParameterItemID: "id-\(title)",
          AnalyticsParameterItemName: item,
          AnalyticsParameterContentType: type
        ])
    }
}
