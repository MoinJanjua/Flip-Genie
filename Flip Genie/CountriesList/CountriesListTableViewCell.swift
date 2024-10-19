//
//  CountriesListTableViewCell.swift
//  Flip Genie
//
//  Created by Developer UCF on 25/07/2024.
//

import UIKit

class CountriesListTableViewCell: UITableViewCell {
@IBOutlet weak var coinImage: UIImageView!
@IBOutlet weak var countryCoin: UILabel!
@IBOutlet weak var arrowKey: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
