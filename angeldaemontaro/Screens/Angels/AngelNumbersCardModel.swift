//
//  File.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 27.03.23.
//

import UIKit

class AngelNumbersCardsDayModel {
    struct AngelNumbersSpreadJson: Decodable {
        let title: String
        var cards: [AngelNumbersCardsJson]
    }
    
    struct AngelNumbersCardsJson: Decodable {
        let key: String
        let description: String
        let locale: String
        let image: String
    }
    
    let jsonPath = "configAngelNumbers"
    var content: [AngelNumbersSpreadJson]?
    
    init() {
        guard
          let url = Bundle.main.url(forResource: jsonPath, withExtension: "json"),
          let data = try? Data(contentsOf: url)
        else { return }

        do {
            content = try JSONDecoder().decode([AngelNumbersSpreadJson].self, from: data)
            
        } catch {
            print(error)
        }
    }
}
