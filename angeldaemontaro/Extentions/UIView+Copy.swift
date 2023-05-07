//
//  UIView+Copy.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 16.08.22.
//

import Foundation
import UIKit

extension UIView {
    func createCopy() -> UIView? {
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: self)
        return NSKeyedUnarchiver.unarchiveObject(with: archivedData) as? UIView
    }
}
