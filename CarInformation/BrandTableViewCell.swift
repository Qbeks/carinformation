//
//  BrandTableViewCell.swift
//  CarInformation
//
//  Created by Kamil Kubis on 28.03.2017.
//  Copyright © 2017 MobiSoft. All rights reserved.
//

import UIKit

class BrandTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
