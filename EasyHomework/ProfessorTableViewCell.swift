//
//  ProfessorTableViewCell.swift
//  B4Grad
//
//  Created by Anthony Giugno on 2016-05-26.
//  Copyright © 2016 Anthony Giugno. All rights reserved.
//

import UIKit

class ProfessorTableViewCell: UITableViewCell {

    @IBOutlet var textField: B4GradTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
