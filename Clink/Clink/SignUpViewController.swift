//
//  SignUpViewController.swift
//  Clink
//
//  Created by Jack Russell on 3/24/22.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var instaField: UITextField!
    @IBOutlet weak var snapField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccount(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user["instagram"] = instaField.text
        user["snap"] = snapField.text
        
        user.signUpInBackground { success, error in
            if success{
                self.performSegue(withIdentifier: "createAccountSegue", sender: nil)
            }
        }
    }
    
    
    @IBAction func goBackToSignIn(_ sender: Any) {
        self.performSegue(withIdentifier: "backToSignInSegue", sender: nil)
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
