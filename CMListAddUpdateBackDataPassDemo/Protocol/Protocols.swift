//
//  PassDataProtocol.swift
//  CMListAddUpdateBackDataPassDemo
//
//  Created by Mirajkar on 27/04/21.
//  Copyright © 2021 Mirajkar. All rights reserved.
//

import Foundation
import UIKit

protocol passDataProtocol : class {
     func passUpdatesCMDetails(cmObject: CMObject, tag: Int?)
}

protocol cellDelegate : class {
    func editButtonPressed(tag: Int)
}

protocol alertProtocol {
    func showAlert(title: String, message: String?, vc: UIViewController)
}

extension alertProtocol {
    func showAlert(title: String, message: String?, vc: UIViewController) {
           let alert = UIAlertController.init(title: title, message: message, preferredStyle:.alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alert.addAction(okAction)
           vc.present(alert, animated: true, completion: nil)
       }
}
