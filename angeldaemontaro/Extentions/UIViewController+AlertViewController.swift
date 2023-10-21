//
//  CustomAlertViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 7.07.22.
//

import UIKit
import GoogleMobileAds

extension UIViewController {
    
    // создание окна
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        //добавляем кнопку в alert
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        alert.view.backgroundColor = .gray
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithShare(title: String, message: String, ok: ((UIAlertAction) -> Void)?, share: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        //добавляем кнопку в alert
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: ok))
        alert.addAction(UIAlertAction(title: "Share", style: UIAlertAction.Style.default, handler: share))
        alert.view.backgroundColor = .gray
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithReward(title: String, message: String, btnOk: String, btnNo: String, _ ok: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        //добавляем кнопку в alert
        alert.addAction(UIAlertAction(title: btnOk, style: .default, handler: { _ in
            ok()
        }))
        alert.addAction(UIAlertAction(title: btnNo, style: UIAlertAction.Style.default, handler: nil))
//        alert.view.backgroundColor = .gray
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithReward(count: Int, key: String, _ ok: @escaping () -> Void) {
        showAlertWithReward(
            title: getLocale(key: "reward_alert_title"),
            message: String(format: getLocale(key: "reward_alert_description"), count),
            btnOk: getLocale(key: "reward_alert_btn_ok"),
            btnNo: getLocale(key: "reward_alert_btn_no")) {
            ok()
        }
    }
    
    func showAlertWithRewardNoAds() {
        showAlert(title: getLocale(key: "reward_alert_title"), message: getLocale(key: "reward_alert_notfound"))
    }
}
