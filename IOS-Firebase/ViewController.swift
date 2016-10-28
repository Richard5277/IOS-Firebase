//
//  ViewController.swift
//  IOS-Firebase
//
//  Created by Feihong Zhao on 2016-10-24.
//  Copyright © 2016 Feihong Zhao. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    func goTablePage(){
        let tableVC = ListTableViewController()
        self.navigationController?.pushViewController(tableVC, animated: true)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.black
        self.view.backgroundColor = UIColor.black
        
        let button1 = UIButton(type: .custom)
        button1.backgroundColor = UIColor.red
        button1.setTitle("TableView", for: .normal)
        button1.tintColor = UIColor.white
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.addTarget(self, action: #selector(ViewController.goTablePage), for: .touchUpInside)
        
//        let button1 = UITextField()
//        button1.backgroundColor = UIColor.gray
//        button1.translatesAutoresizingMaskIntoConstraints = false
//        button1.addTarget(self, action: #selector(ViewController.goTablePage), for: .touchUpInside)
        
        
        let button2 = UIButton(type: .custom)
        button2.backgroundColor = UIColor.blue
        button2.setTitle("Autolayout Page", for: .normal)
        button2.tintColor = UIColor.white
        button2.translatesAutoresizingMaskIntoConstraints = false
//        button2.addTarget(self, action: #selector(ViewController.goAutolayoutPage), for: .touchUpInside)
        
        let button3 = UIButton(type: .custom)
        button3.backgroundColor = UIColor.orange
        button3.setTitle("PAY", for: .normal)
        button3.tintColor = UIColor.black
        button3.translatesAutoresizingMaskIntoConstraints = false
        //        button2.addTarget(self, action: #selector(ViewController.goAutolayoutPage), for: .touchUpInside)
        
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(button3)
        
        let views = [
            "btn1": button1,
            "btn2": button2,
            "btn3": button3
        ]
        
        var allConstraints = [NSLayoutConstraint]()
        
        let button1H = NSLayoutConstraint.constraints(withVisualFormat: "|-20-[btn1]-20-|", options: [], metrics: nil, views: views)
        let button2H = NSLayoutConstraint.constraints(withVisualFormat: "|-20-[btn2]-20-|", options: [], metrics: nil, views: views)
        let button3H = NSLayoutConstraint.constraints(withVisualFormat: "|-20-[btn3]-20-|", options: [], metrics: nil, views: views)
        let allV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[btn1]-20-[btn2(==btn1)]-20-[btn3(==btn1)]-20-|", options: [], metrics: nil, views: views)
        
        allConstraints += button1H
        allConstraints += button2H
        allConstraints += button3H
        allConstraints += allV
        
        NSLayoutConstraint.activate(allConstraints)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

