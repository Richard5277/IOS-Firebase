//
//  Data.swift
//  IOS-Firebase
//
//  Created by Feihong Zhao on 2016-10-28.
//  Copyright © 2016 Feihong Zhao. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Sweet {
    let key: String!
    let content: String!
    let addedByUser: String!
    let itemRef: FIRDatabaseReference?
    
    init(content: String, addedByUser: String, key: String = ""){
        self.key = key
        self.content = content
        self.addedByUser = addedByUser
        self.itemRef = nil
    }
    
    init(snapShot: FIRDataSnapshot){
        key = snapShot.key
        itemRef = snapShot.ref
        
//        if let sweetContent = snapShot.value["content"] as! [String : AnyObject] {
//            content = sweetContent
//        }else{
//            content = ""
//        }
//        
//        if let sweetUser = snapShot.value as! [String : AnyObject] {
//            addedByUser = sweetUser
//        }else{
//            addedByUser = ""
//        }
        
        if let sweetContent = snapShot.children.value(forKey: "contnet") as? String{
            content = sweetContent
        }else{
            content = ""
        }
        
        if let sweetUser = snapShot.children.value(forKey: "addedByUser") as? String{
            addedByUser = sweetUser
        }else{
            addedByUser = ""
        }
    }
    
    func toAnyObject() -> [String : AnyObject] {
        return ["content":content as AnyObject,"addedByUser":addedByUser as AnyObject]
    }
    
}



