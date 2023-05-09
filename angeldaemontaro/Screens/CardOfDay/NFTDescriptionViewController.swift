//
//  MapDescriptionViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 17.07.22.
//

import UIKit

class NFTDescriptionViewController: UIViewController {
    var json: NFTCardsModel.NFTCardsJson?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestureTabBar()
        
        guard let json = json else { return }

        let locale = json.locale
        let key = json.description
        let description = self.getLocaleFromTable(tableName: locale, key: key)
        textView.text = getLocale(key: description)
        imageView.image = json.image.getImageLocale(controller: self)
        
        setupNavBackButton(complete: #selector(backClick))
    }
    
    @objc
    func backClick() {
        self.navigationController?.popViewController(animated: true)
    }
}
