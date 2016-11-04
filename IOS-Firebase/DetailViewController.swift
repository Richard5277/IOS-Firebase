//
//  DetailViewController.swift
//  AllCoding
//
//  Created by Feihong Zhao on 2016-10-12.
//  Copyright © 2016 Zhao Feihong. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let tableView = UITableView()
    var ref: FIRDatabaseReference!
    var sweets = [Sweet]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as UITableViewCell
        
        let sweet = sweets[indexPath.row]
        cell.textLabel?.text = sweet.content
        cell.detailTextLabel?.text = sweet.addedByUser
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        ref = FIRDatabase.database().reference().child("ios-firebase-items")

        self.view.backgroundColor = UIColor.white
        
        let tableView: UITableView = UITableView()
        
        startObservingDB()
        
        var allConstrains = [NSLayoutConstraint]()
        
        let views = [
            "tableView": tableView
        ]
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
        
        let tableViewConstraintH = NSLayoutConstraint.constraints(withVisualFormat: "|-8-[tableView]-8-|", options: [], metrics: nil, views: views)
        
        let tableViewConstraintV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[tableView]-20-|", options: [], metrics: nil, views: views)
        
        allConstrains += tableViewConstraintH
        allConstrains += tableViewConstraintV
        NSLayoutConstraint.activate(allConstrains)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startObservingDB(){
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            var newSweets = [Sweet]()

            for sweet in snapshot.children {
                let sweetObject = Sweet(snapShot: sweet as! FIRDataSnapshot)
                newSweets.append(sweetObject)
            }
            self.sweets = newSweets
            self.tableView.reloadData()
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }

}






