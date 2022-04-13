//
//  DrinksTableViewCell.swift
//  Clink
//
//  Created by Shawn Goforth on 3/29/22.
//

import UIKit
import Parse

class DrinksTableViewCell: UITableViewCell {

    
    var user = PFUser()
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var drinkLabel: UILabel!
    
    @IBOutlet weak var insta: UILabel!
    
    @IBOutlet weak var snap: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}
