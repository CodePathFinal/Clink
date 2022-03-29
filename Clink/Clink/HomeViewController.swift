//
//  HomeViewController.swift
//  Clink
//
//  Created by Jack Russell on 3/24/22.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

    
    @IBOutlet weak var hostToggle: UISwitch!
    var user = PFUser()
    var isHost = true;
    @IBOutlet weak var hostStatus: UIButton!
    
    
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
    
    @IBAction func isHost(_ sender: Any) {
        if(hostToggle.isOn == true){
            isHost = true;
            user["isHost"] = [isHost]
            hostStatus.setTitle("Host" as? String, for: .normal)
            print(isHost)
        }else{
            isHost = false;
            user["isHost"] = [isHost]
            hostStatus.setTitle("Join Host" as? String, for: .normal)
            print(isHost)
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
