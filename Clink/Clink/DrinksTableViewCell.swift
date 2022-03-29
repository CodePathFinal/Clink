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
    @IBOutlet weak var drinkLabel: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var addDrinkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onAddDrinkClick(_ sender: Any) {
        user["drink"] = drinkLabel.text
        
    }
    

}
