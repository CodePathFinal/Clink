//
//  SettingsViewController.swift
//  Clink
//
//  Created by Jack Russell on 3/24/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var instaField: UITextField!
    @IBOutlet weak var snapField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onSubmit(_ sender: Any) {
    }
    @IBAction func onBack(_ sender: Any) {
        self.performSegue(withIdentifier: "settingsToHomeSegue", sender: nil)
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
