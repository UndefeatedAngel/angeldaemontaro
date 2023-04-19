//
//  UIViewController+Navigation.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 19.04.23.
//

import UIKit

extension UIViewController {
    func setupNavBackButton(){
        let button = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(actionBack))
        //TODO: Theme
        button.tintColor = self.traitCollection.userInterfaceStyle == .dark ? .white : .black
        self.navigationItem.leftBarButtonItems = [button]
    }
    
    @objc
    func actionBack()
    {
        self.dismiss(animated: true)
    }
    
    func addNavTitle(text: String) {
        self.navigationItem.title = text
    }
}
