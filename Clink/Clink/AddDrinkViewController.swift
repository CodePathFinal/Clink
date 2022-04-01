//
//  AddDrinkViewController.swift
//  Clink
//
//  Created by Shawn Goforth on 3/31/22.
//

import UIKit
import Parse

class AddDrinkViewController: UIViewController {
    
    var user = PFUser()

    @IBOutlet weak var drinkTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = PFUser.current()!
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func submitDrink(_ sender: Any) {
        let drink = PFObject(className: "Drinks")
        
        drink["drink"] = drinkTextField.text
        drink["username"] = PFUser.current()!
        drink["instagram"] = user["instagram"]
        drink["snapchat"] = user["snap"]
        drink["hostKey"] = user["hostKey"]
        
        drink.saveInBackground { (success, error) in
            if success{
                self.dismiss(animated: true, completion: nil)
                print("saved drink!")
            }else{
                print("error!")
            }
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
