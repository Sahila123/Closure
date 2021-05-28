//
//  SaveViewController.swift
//  CMListAddUpdateBackDataPassDemo
//
//  Created by Mirajkar on 27/04/21.
//  Copyright © 2021 Mirajkar. All rights reserved.
//

import UIKit

class SaveViewController: BaseViewController {

    //MARK: Global Variables
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    var saveClosure : ((CMObject, Int?) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "CM Detail"
        let saveButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveBtnAction))
        self.navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.rightBarButtonItem?.title = "Save"
        
        nameTextField.delegate = self
        stateTextField.delegate = self
    }
 
    //MARK: Button Action
    @objc func saveBtnAction() {
        let state = stateTextField.text?.capitalized
        if nameTextField.text?.count == 0 {
            showAlert(title: "Alert", message: "Enter name", vc: self)
        } else {
            let cmObject = CMObject(name: nameTextField.text,state: state!.isEmpty ? "placeholder" : state, details: detailTextView.text)
            saveClosure?(cmObject, nil)    //optional chaining
            
            //OR  - -- if let or guard let
            
//            if let svClosure = saveClosure {
//                svClosure(cmObject, nil)
//            }
            self.navigationController?.popViewController(animated: true)
        }
    }

}


/*
Data to enter
1..Uddhav Thackeray - Maharashtra
Uddhav Bal Thackeray is an Indian politician serving as the 19th and current Chief Minister of Maharashtra. He is the president of Shiv Sena.

2..B. S. Yediyurappa - Karnataka
Bookanakere Siddalingappa Yediyurappa, often referred to by his initials, B. S. Y., is an Indian politician serving as the 19th and current Chief Minister of Karnataka. Yediyurappa is serving as the Chief Minister of Karnataka for the fourth time.

3..Arvind Kejriwal - Delhi
Arvind Kejriwal is an Indian politician and a former bureaucrat who is the current and 7th Chief Minister of Delhi since February 2015. He was also the Chief Minister of Delhi from December 2013 to February 2014, stepping down after 49 days of assuming power.

4.. Amarinder Singh - Punjab
Captain Amarinder Singh is an Indian politician, military historian, author, former royal and veteran serving as the 15th and current Chief Minister of Punjab.

5..Mamata Banerjee - West Bengal
Mamata Banerjee is an Indian politician who is serving as the 8th and current Chief Minister of West Bengal since 2011, the first woman to hold the office.

6.Vijay Rupani-Gujarat
Vijay Ramniklal Rupani is an Indian politician from the Bharatiya Janata Party. He is serving as Chief Minister of Gujarat since 7 August 2016, and is a member of the Gujarat Legislative Assembly representing Rajkot West.

7..Pramod Sawant - Goa
Pramod Sawant is an Indian politician who is the 13th and current Chief Minister of Goa. Sawant represents the Sanquelim constituency in the Goa Legislative Assembly and is a member of the Bharatiya Janata Party.

8.Nitish Kumar - Bihar
Nitish Kumar is an Indian politician, who is serving as 22nd Chief Minister of Bihar, a state in India, since 2015 and has served in that role on five previous occasions. He has also served as an Union minister in the Union Government of India.


*/
