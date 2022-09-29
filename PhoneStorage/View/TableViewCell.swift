//
//  TableViewCell.swift
//  PhoneStorage
//
//  Created by Леонид Лукашевич on 29.09.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imei: UILabel!
    @IBOutlet weak var model: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
