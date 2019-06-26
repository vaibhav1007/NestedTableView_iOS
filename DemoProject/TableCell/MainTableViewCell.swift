//
//  MainTableViewCell.swift
//  DemoProject
//
//  Created by Vaibhav Gupta on 26/06/19.
//  Copyright © 2019 Vaibhav Gupta. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
