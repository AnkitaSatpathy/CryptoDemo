//
//  TokenCell.swift
//  HashDemo
//
//  Created by 3Embed on 22/07/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class TokenCell: UITableViewCell {

    @IBOutlet weak var tokenLogo: UIImageView!
    @IBOutlet weak var tokenName: UILabel!
    @IBOutlet weak var tokenPrice: UILabel!
    @IBOutlet weak var tokenShortName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
