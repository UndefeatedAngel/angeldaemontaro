//
//  ViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 7.07.22.
//

import UIKit

extension UIViewController {
    //передача данных из локализации по ключу
    func getLocale(key: String) -> String {
        return key.localized()
    }
    
    func getLocaleFromTable(tableName: String, key: String) -> String {
        return key.localizedFromTable(tableName: tableName)
    }
    
    func getLangKey() -> String {
        let appLang = UserDefaults.standard.string(forKey: "app_lang") ?? "ru"
        var langKey = "en"
        if appLang == "ru" {
            langKey = "ru"
        }
        return langKey
    }
}
