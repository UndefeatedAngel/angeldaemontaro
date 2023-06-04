//
//  String.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 15.07.22.
//

import UIKit

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.localizedBundle(), value: "", comment: "")
    }
    
    func localizedFromTable(tableName: String) -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: Bundle.localizedBundle(), value: "", comment: "")
    }
    
    func localizeWithFormat(arguments: CVarArg...) -> String {
        return String(format: self.localized(), arguments: arguments)
    }
    
    func getImageLocale(controller: UIViewController) -> UIImage? {
        let imageName = "\(self )_\(Settings.language)"
        return UIImage(named: imageName)
    }
    
    func getImage(controller: UIViewController) -> UIImage? {
        let imageName = "\(self )"
        return UIImage(named: imageName)
    }
}
