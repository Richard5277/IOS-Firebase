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
    var content: String!
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
        
//        for child in snapShot.children {
//            let _child = child as! FIRDataSnapshot
//            content = _child.value as! String!
//        }
        
//        if let sweetContent = snapShot.children.value(forKey: "content") as? String{
//            content = sweetContent
//        }else{
//            content = ""
//        }
        
        if let sweetContent = snapShot.childSnapshot(forPath: "content").value as? String {
            content = sweetContent
        }else{
            content = ""
        }
                
//        if let sweetUser = snapShot.children.value(forKey: "addedByUser") as? String{
//            addedByUser = sweetUser
//        }else{
//            addedByUser = ""
//        }
        if let sweetUser = snapShot.childSnapshot(forPath: "addedByUser").value as? String {
            addedByUser = sweetUser
        }else{
            addedByUser = ""
        }
    }
    
    func toAnyObject() -> [String : AnyObject] {
        return ["content":content as AnyObject,"addedByUser":addedByUser as AnyObject]
    }
    
}



