//
//  HomeViewController.swift
//  Clink
//
//  Created by Jack Russell on 3/24/22.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

    
    var user = PFUser()
    
    @IBOutlet weak var hostStatus: UIButton!
    @IBOutlet weak var keyTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = PFUser.current()!

        // Do any additional setup after loading the view.
    }
    @IBAction func onSettings(_ sender: Any) {
       self.performSegue(withIdentifier: "settingsSegue", sender: nil)
    }
    
    @IBAction func onSignOut(_ sender: Any) {
        
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let signInViewController = main.instantiateViewController(identifier: "SignInScreen")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        delegate.window?.rootViewController = signInViewController
        
    }
    

    @IBAction func joinOnClick(_ sender: Any) {
        var keyTest = keyTextField.text
//        let query = PFQuery(className: "Orders")
//        query.includeKey("hostKey")
        if(keyTest == user["hostKey"] as? String){
            performSegue(withIdentifier: "HostClink", sender: nil)
        }
    }
    
    //Used to create a random key for the host
    func randomAlphaNumericString(length: Int) -> String {
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(allowedChars.count)
        var randomString = ""

        for _ in 0 ..< length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }

        return randomString
    }
    
    
    @IBAction func onHostCick(_ sender: Any) {
//        let order = PFObject(className: "Orders")
//        order["host"] = user.username
//        order["users"] = []
//        order["drinks"] = []
//        order["hostKey"] = Int.random(in: 1..<10000)
        
        
        
        let randKey = randomAlphaNumericString(length: 15)
        user["hostKey"] = randKey
        user.saveInBackground()
//        selectedOrder.add(order, forKey: "Orders")
        self.performSegue(withIdentifier: "HostClink", sender: nil)

        
        
    }
    
    
    /*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
