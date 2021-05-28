//
//  CMListViewController.swift
//  CMListAddUpdateBackDataPassDemo
//
//  Created by Mirajkar on 27/04/21.
//  Copyright © 2021 Mirajkar. All rights reserved.
//

import UIKit

class CMListViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,cellDelegate {
    
    //MARK: Global Variables
    @IBOutlet weak var tableView: UITableView!
    var listOfCMArray : [CMObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CM List"
        let rightBtn = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addBtnAction))
        self.navigationItem.rightBarButtonItem = rightBtn
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    //MARK: UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listOfCMArray.count == 0 {
            tableView.setEmptyView(title: "You don't have any list.", message: "You have to add CM details.")
        } else {
            tableView.restore()
        }
        
        return listOfCMArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCMListTableViewCell", for: indexPath) as? CustomCMListTableViewCell
        if listOfCMArray.count != 0 {
            let cmObj = listOfCMArray[indexPath.row]
            cell?.nameLabel.text = cmObj.name
            cell?.cmImageView.image = UIImage(named: cmObj.state!) ?? UIImage(named: "placeholder")
            cell?.editButton.tag = indexPath.row
            cell?.cellDelegate = self
        }
        return cell ?? UITableViewCell()
    }
    
    //MARK: UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cmObj = listOfCMArray[indexPath.row]
        
        //Alert
        showAlert(title: cmObj.name!, message: cmObj.details, vc: self)
    }
    
    //MARK: Button Actions
    @objc func addBtnAction() {
        guard let saveVCObj = storyboard?.instantiateViewController(identifier: "SaveViewControllerID") as? SaveViewController else {
            return
        }
        //        saveVCObj.delegate = self
        saveVCObj.saveClosure = { [weak self] (cmObject, index) in
            
            if let tag = index {
                self?.listOfCMArray.remove(at: tag)
                self?.listOfCMArray.insert(cmObject, at: tag)
            } else {
                self?.listOfCMArray.append(cmObject)
            }
            self?.tableView.reloadData()
        }
        self.navigationController?.pushViewController(saveVCObj, animated: true)
    }
    
    //MARK: Protocol Methods    
    
    func editButtonPressed(tag: Int) {
        let updateVC = storyboard?.instantiateViewController(identifier: "UpdateViewControllerID") as? UpdateViewController
        guard let updateVCObj = updateVC else {
            return
        }
        updateVCObj.cmObject = listOfCMArray[tag]
        updateVCObj.tag = tag
        updateVCObj.updateClosure = { [weak self] (cmObject, index) in
            if let tag = index {
                          self?.listOfCMArray.remove(at: tag)
                          self?.listOfCMArray.insert(cmObject, at: tag)
                      } else {
                          self?.listOfCMArray.append(cmObject)
                      }
                      self?.tableView.reloadData()
        }
        self.navigationController?.pushViewController(updateVCObj, animated: true)
    }
}


extension UITableView {
    
    func setEmptyView(title: String, message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        // The only tricky part is here:
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
