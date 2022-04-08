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
    
    var orders = [PFObject]()
    var selectedOrder: PFObject!
    
    @IBOutlet weak var hostStatus: UIButton!
    @IBOutlet weak var keyTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        user = PFUser.current()!
        user["hostKey"] = ""

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
        user = PFUser.current()!
        var keyTest = keyTextField.text
        let query = PFQuery(className: "Orders")
        query.includeKey("hostKey")
        if(keyTest != ""){
//            query.whereKey("hostKey", contains: keyTest!)
            query.whereKey("hostKey", equalTo: keyTest)
            query.findObjectsInBackground { (orders, error: Error?) in
                if let error = error {
                    // The request failed
                    print(error.localizedDescription)
                } else if let orders = orders {
                    for order in orders {
                        print(order as Any)
                        self.user["hostKey"] = keyTest as? String
                        self.user.saveInBackground()
                        order.addUniqueObjects(from: orders, forKey: "users")
                        order.saveInBackground()
                        self.performSegue(withIdentifier: "HostClink", sender: nil)
                            print("Successfully found host")
                    }

                }
            }
        }else{
            print("Error: No Key provided")
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
        user = PFUser.current()!
        let order = PFObject(className: "Orders")
        order["hostUsername"] = user["username"]
        order["drinks"] = []

        let randKey = randomAlphaNumericString(length: 12)
        order["hostKey"] = randKey
        order.addUniqueObject(self.user as? PFUser, forKey: "users")
        user["hostKey"] = randKey
        user.saveInBackground()
//        selectedOrder.add(order, forKey: "Orders")
        order.saveInBackground { (success, error) in
            if(success){
                print("Order array created")
                self.performSegue(withIdentifier: "HostClink", sender: nil)
            }else{
                print("Error saving key! \(error)")
            }
        }
        
        
    }
    
    
    /*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
