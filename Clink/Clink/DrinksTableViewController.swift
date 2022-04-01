//
//  DrinksTableViewController.swift
//  Clink
//
//  Created by Shawn Goforth on 3/28/22.
//

import UIKit
import Parse

class DrinksTableViewController: UITableViewController {

    var user = PFUser()
    
    var order = PFObject(className: "Orders")
    var numberOfDrinks = 0
    let myRefreshControl = UIRefreshControl()
    @IBOutlet weak var keyTextField: UITextField!
    var key = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(numberOfDrinks > 0){
            loadDrinks()
        }
        user = PFUser.current()!
        let hostKey = user["hostKey"] as? String
        keyTextField.text = hostKey
        key = hostKey as! String
        myRefreshControl.addTarget(self, action: #selector(loadDrinks), for: .valueChanged)
        tableView.refreshControl = myRefreshControl
        
        

//         Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadDrinks()
    }
    // MARK: - Table view data source

    @objc func loadDrinks(){
        numberOfDrinks = 0
        
        let myParams = ["count": numberOfDrinks]
        let query = PFQuery(className: "Drinks")
        let order = PFObject(className: "Orders")
        let drink = PFObject(className: "Drinks")
        
        query.includeKeys(["drink", "hostKey"])
        query.whereKey(user["hostKey"] as! String, equalTo: order["hostKey"])
        
        query.findObjectsInBackground { (drinks, error: Error?) in
            if let error = error {
                // The request failed
                print(error.localizedDescription)
            } else if let drinks = drinks {
                for drink in drinks {
                    print(drink as Any)
                    order.addUniqueObject(drink, forKey: "drinks")
                    order.saveInBackground()
                    print("Successfully found drinks")
                }

            }
        }
        self.tableView.reloadData()
        self.myRefreshControl.endRefreshing()
    }
    
    //Still needs to be updated
    func loadMoreDrinks(){
        var getSize = order["drinks"] as! [String]
        numberOfDrinks = getSize.count
        let myParams = ["count": numberOfDrinks]
        //repeate the process in load Drinks
        self.tableView.reloadData()
        self.myRefreshControl.endRefreshing()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfDrinks
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinksCell", for: indexPath) as! DrinksTableViewCell
        cell.usernameLabel.text = user["username"] as? String
        cell.drinkLabel.text = user["drinks"] as? String
//When we have profile pictures added we can impliment this
        
//        let imageUrl = URL(string: (user["profile_image_url_https"] as? String)!)
//        let data = try? Data(contentsOf: imageUrl!)
//
//        if let imageData = data{
//            cell.profileImageView.image = UIImage(data: imageData)
//        }
        
        return cell
    }
    
  
    @IBAction func addDrinkButton(_ sender: Any) {
        self.performSegue(withIdentifier: "AddDrinkView", sender: nil)
    }
    
    
    
    @IBAction func backToHomeFromHost(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
