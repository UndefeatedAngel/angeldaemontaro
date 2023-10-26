//
//  File.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 27.03.23.
//

import UIKit

class AngelNumbersDescriptionViewController: UIViewController {
    
    var json: AngelNumbersCardsDayModel.AngelNumbersCardsJson?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = getLocale(key: "angelsMenu")
        
        setupGestureTabBar()
        
        guard let json = json else { return }

        let locale = json.locale
        let key = json.description
        let description = self.getLocaleFromTable(tableName: locale, key: key)
        textView.text = getLocale(key: description)
        imageView.image = json.image.getImage(controller: self)
        
        updateTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logScreen(screenName: "AngelDetail", screenClass: String(describing: self))
    }
    
    @IBAction func onCloseClick(_ sender: Any) {
        logEventClick(title: "angel", item: "back")
        dismiss(animated: true)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
    
    private func updateTheme() {
        let isDark = traitCollection.userInterfaceStyle == .dark
        
        let colorWhite = isDark ? UIColor.white : UIColor.black
//        let colorDark = isDark ? UIColor.black : UIColor.white
        
        textView.textColor = colorWhite
    }
}
