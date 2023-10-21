//
//  AdsData.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 18.10.23.
//

import Foundation

public class AdsData {
    private static let intertitialCountKey = "angeldaemontaro_ads_intertitial_count"
    public static var intertitialCount: Int {
        get {
            return UserDefaults.standard.integer(forKey: intertitialCountKey)
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: intertitialCountKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    private static let rewardCountKey = "angeldaemontaro_ads_rewardcount_"
    public static func setRewardType(type: String, count: Int) {
        UserDefaults.standard.set(count, forKey: rewardCountKey + type)
        UserDefaults.standard.synchronize()
    }
    
    public static func getRewardType(type: String) -> Int {
        return UserDefaults.standard.integer(forKey: rewardCountKey + type)
    }
}
