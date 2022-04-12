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
    var drinksObj = [PFObject]()
    var order = PFObject(className: "Orders")
    var numberOfDrinks = 0
    let myRefreshControl = UIRefreshControl()
    @IBOutlet weak var keyTextField: UITextField!
    var key = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//            loadDrinks()
        user = PFUser.current()!
        let hostKey = user["hostKey"] as? String
        keyTextField.text = hostKey
        key = hostKey!
        myRefreshControl.addTarget(self, action: #selector(loadDrinks), for: .valueChanged)
        tableView.refreshControl = myRefreshControl
        
        

//         Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        numberOfDrinks = drinksObj.count
        self.loadDrinks()
    }
    // MARK: - Table view data source

    @objc func loadDrinks(){
        
        let query = PFQuery(className: "Drinks")
        let order = PFObject(className: "Orders")

        query.includeKeys(["drink", "hostKey"])
        
        query.findObjectsInBackground { (drinks, error: Error?) in
            if let error = error {
                // The request failed
                print(error.localizedDescription)
            } else if let drinks = drinks {
                for drink in drinks {
                    if(drink["hostKey"] as! String == self.key && !drinks.isEmpty){
                        self.drinksObj += [drink]
                        print("Successfully found drinks")
                    }
                }
            }
        }
        
        let query2 = PFQuery(className: "Orders")
        
        query2.includeKeys(["hostKey", "drinks"])
//        query2.whereKey(user["hostKey"] as! String, equalTo:order["hostKey"])
        query2.findObjectsInBackground{(orders, error: Error?) in
            if let error = error {
                // The request failed
                print(error.localizedDescription)
            } else if let orders = orders {
                for order in orders {
                    if(order["hostKey"] != nil && order["hostKey"] as! String == self.key){
                        
                        order.addUniqueObjects(from: self.drinksObj, forKey: "drinks")
                        self.numberOfDrinks = orders.count
                        order.saveInBackground()
                    }

                }
            }else{
                print(error?.localizedDescription)
            }
        }
        
        self.tableView.reloadData()
        self.myRefreshControl.endRefreshing()
    }
    
    //Still needs to be updated
    func loadMoreDrinks(){

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
        
        return cell
    }
    
  
    @IBAction func addDrinkButton(_ sender: Any) {
        self.performSegue(withIdentifier: "AddDrinkView", sender: nil)
    }
    
    
    
    @IBAction func backToHomeFromHost(_ sender: Any) {
        self.user["hostKey"] = ""
        self.user.saveInBackground()
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
