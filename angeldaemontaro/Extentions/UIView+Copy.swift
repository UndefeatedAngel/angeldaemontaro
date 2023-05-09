//
//  UIView+Copy.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 16.08.22.
//

import Foundation
import UIKit

extension UIView {
    func copyObject<T: NSObject>() throws -> T? {
        let data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
        return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? T
    }
    
    func createCopy() -> UIView? {
        do {
            return try self.copyObject()
        } catch {
            return nil
        }
    }
}
