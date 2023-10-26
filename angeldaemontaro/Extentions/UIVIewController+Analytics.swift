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
        Analytics.setUserID(id)
    }
    
    func logScreen(screenName: String, screenClass: String) {
        Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: screenName,
                                        AnalyticsParameterScreenClass: screenClass])
    }
    
    func logEvent(title: String, item: String, type: String) {
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
          AnalyticsParameterItemID: "id-\(title)",
          AnalyticsParameterItemName: item,
          AnalyticsParameterContentType: type,
        ])
    }
}
