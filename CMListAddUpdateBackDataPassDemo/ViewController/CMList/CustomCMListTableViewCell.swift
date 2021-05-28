//
//  CustomCMListTableViewCell.swift
//  CMListAddUpdateBackDataPassDemo
//
//  Created by Mirajkar on 27/04/21.
//  Copyright © 2021 Mirajkar. All rights reserved.
//

import UIKit

//protocol YourCellDelegate : class {
//    func didPressButton(_ tag: Int)
//}

class CustomCMListTableViewCell: UITableViewCell {

    //MARK: Global Variable
   
    @IBOutlet weak var cmImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
   
    var cellDelegate: cellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func editButtonPressed(sender: UIButton) {
        cellDelegate?.editButtonPressed(tag: sender.tag)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
