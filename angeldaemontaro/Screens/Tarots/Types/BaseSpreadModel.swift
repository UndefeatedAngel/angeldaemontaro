//
//  BaseSpreadModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 7.08.22.
//

import UIKit

class BaseSpreadModel {
    struct BaseSpreadJson: Encodable, Decodable {
        let image: String
        let description: String
        
        init(image: String, description: String) {
            self.image = image
            self.description = description
        }
    }
    
    var jsonPath = ""
    let format = "json"
    var cards: [BaseSpreadJson]?
    
    init(jsonPath: String) {
        self.jsonPath = jsonPath
        guard
          let url = Bundle.main.url(forResource: jsonPath, withExtension: format),
          let data = try? Data(contentsOf: url)
        else { return }

        do {
            cards = try JSONDecoder().decode([BaseSpreadJson].self, from: data)
            
        } catch {
            print(error)
        }
    }
}
