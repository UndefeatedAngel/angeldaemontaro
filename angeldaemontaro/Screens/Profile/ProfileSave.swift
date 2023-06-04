//
//  ProfileSave.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 4.06.23.
//

import UIKit

class ProfileSave {
    static let profileImageKey = "angeldaemontaro_profileImage"
    static var image: Data? {
        get {
            guard let value = UserDefaults.standard.value(forKey: profileImageKey) as? Data else { return nil }
            
            return value
        }
        set (value) {
            UserDefaults.standard.setValue(value, forKey: profileImageKey)
        }
    }
    
    static let firstNameKey = "angeldaemontaro_firstname"
    static var firstName: String? {
        get {
            guard let value = UserDefaults.standard.value(forKey: firstNameKey) as? String else { return nil }
            
            return value
        }
        set (value) {
            UserDefaults.standard.setValue(value, forKey: firstNameKey)
        }
    }
    
    static let lastNameKey = "angeldaemontaro_lastname"
    static var lastName: String? {
        get {
            guard let value = UserDefaults.standard.value(forKey: lastNameKey) as? String else { return nil }
            
            return value
        }
        set (value) {
            UserDefaults.standard.setValue(value, forKey: lastNameKey)
        }
    }
    
    static let dateBithKey = "angeldaemontaro_dateBith"
    static var dateBith: Date? {
        get {
            guard let value = UserDefaults.standard.value(forKey: dateBithKey) as? Date else { return nil }
            
            return value
        }
        set (value) {
            UserDefaults.standard.setValue(value, forKey: dateBithKey)
        }
    }
    
    static let aboutKey = "angeldaemontaro_about"
    static var about: String? {
        get {
            guard let value = UserDefaults.standard.value(forKey: aboutKey) as? String else { return nil }
            
            return value
        }
        set (value) {
            UserDefaults.standard.setValue(value, forKey: aboutKey)
        }
    }

}
