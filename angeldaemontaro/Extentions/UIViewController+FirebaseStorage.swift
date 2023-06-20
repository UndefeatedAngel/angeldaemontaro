//
//  UIViewController+FirebaseStorage.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 20.06.23.
//

import UIKit
import FirebaseStorage

extension UIViewController {
    func getFirebaseJson(jsonName: String, success: @escaping (_ dataJson: Data) -> Void, error: @escaping () -> Void) {
        let storage = Storage.storage(url: "gs://angel-daemon-taro.appspot.com")
        let configVideoUrl = storage.reference(withPath: jsonName)
        configVideoUrl.getData(maxSize: 1*1024*1024) { [weak self] data, errorLog in
            guard self != nil else { return }
            guard let data = data, errorLog == nil else {
                error()
                return
            }
            
            success(data)
        }
    }
}
