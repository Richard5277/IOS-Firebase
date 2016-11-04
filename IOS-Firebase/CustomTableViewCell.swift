//
//  CustomTableViewCell.swift
//  IOS-Firebase
//
//  Created by Feihong Zhao on 2016-11-02.
//  Copyright © 2016 Feihong Zhao. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
