//
//  Bundle.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 15.07.22.
//

import UIKit

extension Bundle {
    private static var bundle: Bundle!
    public static func localizedBundle() -> Bundle! {
        if bundle == nil {
            let appLang = Settings.language
            let path = Bundle.main.path(forResource: appLang, ofType: "lproj")
            bundle = Bundle(path: path!)
        }
        return bundle
    }
    public static func setLanguage(lang: String) {
        Settings.language = lang
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        bundle = Bundle(path: path!)
    }
}
