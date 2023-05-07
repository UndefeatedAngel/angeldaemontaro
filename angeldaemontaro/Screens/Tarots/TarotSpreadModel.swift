//
//  TarotSpreadModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 15.07.22.
//

import UIKit

class TarotSpreadModel {
    struct TarotSpreadJson: Decodable {
        let title: String
        let image: String
        let storyboard: String
        let controller: String
        let config: String
        let locale: String
        let save: String
    }
    
    let jsonPath = "configTarotSpreads"
    var contents: [TarotSpreadJson]?
    
    init() {
        guard
          let url = Bundle.main.url(forResource: jsonPath, withExtension: "json"),
          let data = try? Data(contentsOf: url)
        else { return }

        do {
            contents = try JSONDecoder().decode([TarotSpreadJson].self, from: data)
        } catch {
            print(error)
        }
    }
}
