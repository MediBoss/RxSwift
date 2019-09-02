//
//  HomeTableViewCell.swift
//  RxIntro
//
//  Created by Medi Assumani on 9/2/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let cellID = "homeCellId"

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    
    func configureCell(withUser user: User) {
        
        self.userNameLabel.text = user.username
        self.followerCountLabel.text = String(user.followerCount)
    }
}
