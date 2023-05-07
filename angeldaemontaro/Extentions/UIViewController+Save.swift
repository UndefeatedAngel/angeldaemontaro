//
//  UIViewController+Save.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 7.05.23.
//

import UIKit

extension UIViewController {
    func getModelJsonFromSave(saveField: String?) -> [BaseSpreadModel.BaseSpreadJson]{
        var model = [BaseSpreadModel.BaseSpreadJson]()
        if let json = saveField {
            do {
                let data = Data(json.utf8)
                model = try JSONDecoder().decode([BaseSpreadModel.BaseSpreadJson].self, from: data)
            } catch {
            }
        }
        
        return model
    }
}
