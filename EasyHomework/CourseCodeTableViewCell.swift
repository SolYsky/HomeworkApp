//
//  CourseCodeTableViewCell.swift
//  B4Grad
//
//  Created by Anthony Giugno on 2017-04-18.
//  Copyright © 2017 Anthony Giugno. All rights reserved.
//

import UIKit

class CourseCodeTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: B4GradTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
