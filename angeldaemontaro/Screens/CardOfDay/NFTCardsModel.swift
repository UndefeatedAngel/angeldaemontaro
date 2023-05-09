//
//  MapCardModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 17.07.22.
//

import UIKit

class NFTCardsModel {
    struct NFTSpreadJson: Decodable {
        let title: String
        let color: String
        let cards: [NFTCardsJson]
    }
    
    struct NFTCardsJson: Decodable {
        let description: String
        let locale: String
        let image: String
    }
    
    let jsonPath = "configNFTCards"
    var content: [NFTSpreadJson]?
    
    init() {
        guard
          let url = Bundle.main.url(forResource: jsonPath, withExtension: "json"),
          let data = try? Data(contentsOf: url)
        else { return }

        do {
            content = try JSONDecoder().decode([NFTSpreadJson].self, from: data)
            
        } catch {
            print(error)
        }
    }
}
