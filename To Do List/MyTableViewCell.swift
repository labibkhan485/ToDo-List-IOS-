//
//  MyTableViewCell.swift
//  To Do List
//
//  Created by Labib Khan on 12/27/22.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblPriority: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
