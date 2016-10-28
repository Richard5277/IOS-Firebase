
//
//  User.swift
//  IOS-Firebase
//
//  Created by Feihong Zhao on 2016-10-28.
//  Copyright © 2016 Feihong Zhao. All rights reserved.
//

import Foundation
import FirebaseAuth

struct User {
    let uid: String
    let email: String?
    
    init(userData: FIRUser){
        uid = userData.uid
        if let mail = userData.providerData.first?.email {
            email = mail
        } else {
            email = ""
        }
    }
    
    init(uid: String, email: String){
        self.uid = uid
        self.email = email
    }
}


