//
//  TarotDescriptionViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 17.07.22.
//

import UIKit

class TarotDescriptionViewController: UIViewController {
    private let keyMapOfDay = "buttomMapOfDay"
    private let keyMapOfDaySave = "cardOfDaySave"
    
    var currentSave: String = ""
    var tarotField: String = ""
    var content: TarotSpreadModel.TarotSpreadJson?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var space1: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var space2: UIView!
    @IBOutlet weak var desciptionLabel: UILabel!
    @IBOutlet weak var space3: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        content = TarotSpreadModel().contents?.first(where: { json in
            return json.save == tarotField
        })

//        if currentSave.tarotField == keyMapOfDaySave {
//            createDescriptionMapOfDay()
//        } else {
            createDescription()
//        }
        updateTheme()
    }
    
//    func createDescriptionMapOfDay() {
//        var descriptionString = ""
//        let localeTitle = getLocale(key: keyMapOfDay)
//        let model = getModelJsonFromSave(saveField: currentSave?.saveField)[0]
//        let cardOfDayJson = MenuCardsDayModel().cards?.first(where: { card in
//            return card.description.elementsEqual(model.description)
//        })
//
//        guard let cardOfDayJson = cardOfDayJson else { return }
//
//
//        let localePoint = getLocaleFromTable(tableName: cardOfDayJson.locale, key: cardOfDayJson.description)
//
//        // Добавление описания
//        if !localeTitle.isEmpty {
//            descriptionString.append("\(localeTitle):")
//        }
//        // Добавление пункта
//        descriptionString.append("\(localePoint)")
//
//        addDescription(title: localeTitle, image: model.image.getImageLocale(controller: self), description: localePoint)
//    }
    
    func createDescription() {
        guard let content = content else { return }

        let model = getModelJsonFromSave(saveField: currentSave)

        for index in 0..<model.count {
            let localeTitle = getLocaleFromTable(tableName: content.locale, key: "title_\(index)")
            let keyDescription = model[index].description
            let localePoint = getLocaleFromTable(tableName: content.locale, key: keyDescription)

            addDescription(title: localeTitle,
                           image: model[index].image.getImageLocale(controller: self), description: localePoint)
        }
    }
    
    func addDescription(title: String, image: UIImage?, description: String) {
        if let copyTitle = titleLabel.createCopy() as? UILabel {
            copyTitle.text = title
            copyTitle.isHidden = false
            stackView.addArrangedSubview(copyTitle)
        }
        
        if let copySpace1 = space1.createCopy() {
            copySpace1.isHidden = false
            stackView.addArrangedSubview(copySpace1)
        }
        
        if let copyImageView = imageView.createCopy() as? UIImageView {
            copyImageView.image = image
            copyImageView.isHidden = false
            stackView.addArrangedSubview(copyImageView)
        }
        
        if let copySpace2 = space2.createCopy() {
            copySpace2.isHidden = false
            stackView.addArrangedSubview(copySpace2)
        }
        
        if let copyDescription = desciptionLabel.createCopy() as? UILabel {
            copyDescription.text = description
            copyDescription.isHidden = false
            stackView.addArrangedSubview(copyDescription)
        }
        
        if let copySpace3 = space3.createCopy() {
            copySpace3.isHidden = false
            stackView.addArrangedSubview(copySpace3)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
    
    private func updateTheme() {
        let isDark = traitCollection.userInterfaceStyle == .dark
        
        let colorWhite = isDark ? UIColor.white : UIColor.black
        let colorDark = isDark ? UIColor.black : UIColor.white
        
        for view in stackView.arrangedSubviews {
            if let label = view as? UILabel {
                label.textColor = colorWhite
            }
        }
    }
}
