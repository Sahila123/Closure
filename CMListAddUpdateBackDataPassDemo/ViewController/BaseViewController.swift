//
//  BaseViewController.swift
//  CMListAddUpdateBackDataPassDemo
//
//  Created by Mirajkar on 13/05/21.
//  Copyright © 2021 Mirajkar. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UITextFieldDelegate, alertProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: UITextFieldDelegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           // User finished typing (hit return): hide the keyboard.
           textField.resignFirstResponder()
           return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}
