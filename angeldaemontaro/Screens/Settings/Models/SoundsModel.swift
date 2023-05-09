//
//  SoundsModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 8.09.22.
//

import UIKit

enum SoundsModel: Int, CustomStringConvertible {
    case on
    case off
    
    var description: String {
        switch self {
        case .on: return "on"
        case .off: return "off"
        }
    }
}
