//
//  ListTableViewController.swift
//  IOS-Firebase
//
//  Created by Feihong Zhao on 2016-10-28.
//  Copyright © 2016 Feihong Zhao. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ListTableViewController: UITableViewController {
    
    var ref: FIRDatabaseReference!
    var sweets = [Sweet]()
    
    func addSweet(){
        let sweetAler = UIAlertController(title: "New Sweet", message: "Enter Your Sweet", preferredStyle: .alert)
        sweetAler.addTextField { (textField: UITextField) in
            textField.placeholder = "YOUR SWEET"
        }
        sweetAler.addAction(UIAlertAction(title: "Send", style: .default, handler: { (action: UIAlertAction) in
            if let sweetContent = sweetAler.textFields?.first?.text{
                let sweet = Sweet(content: sweetContent, addedByUser: "Richard")
                let sweetRef = self.ref.child(sweetContent.lowercased())
                
                sweetRef.setValue(sweet.toAnyObject())
            }
        }))
        
        self.present(sweetAler, animated: true, completion: nil)
    }
    
    func startObservingDB(){
        var newSweets = [Sweet]()

        ref.observeSingleEvent(of: .value, with: {(snapshot: FIRDataSnapshot) in
            for sweet in snapshot.children {
                let sweetObject = Sweet(snapShot: sweet as! FIRDataSnapshot)
                newSweets.append(sweetObject)
            }
            
            self.sweets = newSweets
            self.tableView.reloadData()
            
        }) { error in
            print(error.localizedDescription)
        }
    
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference().child("ios-firebase-items")
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        startObservingDB()
        
        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(ListTableViewController.addSweet))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sweets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = CustomTableViewCell(style: .subtitle, reuseIdentifier: "cell")
    
        let sweet = sweets[indexPath.row]
        
        cell.textLabel?.text = sweet.content
        cell.detailTextLabel?.text = sweet.addedByUser
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
