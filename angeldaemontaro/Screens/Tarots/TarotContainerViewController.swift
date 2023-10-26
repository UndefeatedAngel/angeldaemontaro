//
//  TarotContainerViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 13.08.22.
//

import UIKit

class TarotContainerViewController: UIViewController {
    private let buttonLocaleMakeKey = "buttonTarotMake"
    private let buttonLocaleWriteKey = "buttonTarotWrite"
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var buttonNext: UIButton! {
        didSet {
            buttonNext.clipsToBounds = true
            buttonNext.layer.cornerRadius = 10
        }
    }
    
    var content: TarotSpreadModel.TarotSpreadJson?
    var controllerTarot: BaseTarotViewController?
    
    private var step = 0
    private let descriptionSegue = "tarotDescriptionSegue"
    
    var spreadModel: BaseSpreadModel?
    
    var jsonCurrentSave: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLocaleButton()
        
        guard let content = content else { return }
        
        controllerTarot = createViewController(content.storyboard, content.controller) as? BaseTarotViewController
        
        guard let controllerTarot = controllerTarot else { return }
        
        addChild(controllerTarot)
        controllerTarot.view.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(controllerTarot.view)
        NSLayoutConstraint.activate([
            controllerTarot.view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            controllerTarot.view.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            controllerTarot.view.topAnchor.constraint(equalTo: container.topAnchor),
            controllerTarot.view.bottomAnchor.constraint(equalTo: container.bottomAnchor)])
        controllerTarot.didMove(toParent: self)
        
        spreadModel = BaseSpreadModel(jsonPath: content.config)
        
        setupNavTitle(text: getLocale(key: content.title))
        
        updateTheme()
    }
    
    @IBAction func onClickButtonNext(_ sender: Any) {
        switch step {
        case 0:
            prepareTarot()
        default:
            showDescriptionTarot()
        }
        
        step = 1
        setLocaleButton()
    }
    
    private func setLocaleButton() {
        var key = buttonLocaleMakeKey
        if step == 1 {
            key = buttonLocaleWriteKey
        }
        buttonNext.setTitle(getLocale(key: key), for: .normal)
    }
    
    func prepareTarot() {
//        guard let content = content else { return }
        
        buttonNext.isUserInteractionEnabled = false
        guard let pick4Elements = spreadModel?.cards?.choose(controllerTarot?.arrayViews.count ?? 0) else { return }
        var model = [BaseSpreadModel.BaseSpreadJson]()

        // random
        for element in pick4Elements {
            model.append(element)
        }
        // save to core data
        let jsonEncoder = JSONEncoder()
        do {
            // prepare json
            let jsonData = try jsonEncoder.encode(model)
            let json = String(data: jsonData, encoding: .utf8)
            // prepare date
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "MM-dd-yyyy HH:mm:ss"
//            let date = dateFormatterGet.string(from: Date.now)
            // invoke method coredata
            jsonCurrentSave = json ?? ""
//            saveName(tarot: content.save,date: date, save: json ?? "", title: content.title)
        } catch {
        }
        
        for index in 0..<model.count {
            let imageName = model[index].image
            if let imageView = controllerTarot?.arrayViews[index] {
                imageView.image = imageName.getImageLocale(controller: self)
                controllerTarot?.animateCardDay(imageView: imageView) { _ in
                    self.buttonNext.isUserInteractionEnabled = true
                }
            }
        }
        
        logEventClick(title: "tarot", item: "prepare_"+(content?.key ?? ""))
    }
    
    func showDescriptionTarot() {
        logEventClick(title: "tarot", item: "show_"+(content?.key ?? ""))
        performSegue(withIdentifier: descriptionSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? TarotDescriptionViewController {
            controller.currentSave = jsonCurrentSave
            controller.tarotField = content?.save ?? ""
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
    
    private func updateTheme() {
        let isDark = traitCollection.userInterfaceStyle == .dark
        
        let colorWhite = isDark ? UIColor.white : UIColor.black
        let colorDark = isDark ? UIColor.black : UIColor.white
        
        self.navigationController?.navigationBar.tintColor = colorWhite
        buttonNext.tintColor = colorWhite
        buttonNext.backgroundColor = colorDark
    }
}
