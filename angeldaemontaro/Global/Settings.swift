//
//  Settings.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 28.04.23.
//

import Foundation

public class Settings {
    private static let keyLanguage = "angeldaemontaro_language"
    public static var language: String {
        get {
            return UserDefaults.standard.string(forKey: keyLanguage) ?? (Locale.current.languageCode == "ru" ? "ru" : "en")
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: keyLanguage)
            UserDefaults.standard.synchronize()
        }
    }
    
    private static let keyTheme = "angeldaemontaro_theme"
    public static var theme: String {
        get {
            return UserDefaults.standard.string(forKey: keyTheme) ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: keyTheme)
            UserDefaults.standard.synchronize()
        }
    }
    
    private static let keySounds = "angeldaemontaro_isSounds"
    public static var isSounds: Bool {
        get {
            return UserDefaults.standard.bool(forKey: keySounds)
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: keySounds)
            UserDefaults.standard.synchronize()
        }
    }
}
