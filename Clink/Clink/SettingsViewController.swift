//
//  SettingsViewController.swift
//  Clink
//
//  Created by Jack Russell on 3/24/22.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {

    @IBOutlet weak var instaField: UITextField!
    @IBOutlet weak var snapField: UITextField!
    var user = PFUser()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        user = PFUser.current()!
        if(user["instagram"] != nil){
            instaField.text = (user["instagram"] as! String)
        }
        if(user["snap"] != nil){
            snapField.text = (user["snap"] as! String)
        }
        
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        user["snap"] = snapField.text
        user["instagram"] = instaField.text
        
        user.saveInBackground()
    }
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
