//
//  VideoModel.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 20.06.23.
//

import UIKit

class VideoModel {
    struct VideoModelJson: Decodable {
        let title: String
        let description: String
        let link: String
    }
    
    let jsonPath = "configVideo"
    var content: [VideoModelJson]?
    
    init() {
        guard
          let url = Bundle.main.url(forResource: jsonPath, withExtension: "json"),
          let data = try? Data(contentsOf: url)
        else { return }

        do {
            content = try JSONDecoder().decode([VideoModelJson].self, from: data)
            
        } catch {
            print(error)
        }
    }
}
