//
//  User.swift
//  RxIntro
//
//  Created by Medi Assumani on 9/2/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    var username: String
    var followerCount: Int
    
    init(username: String, followerCount: Int) {
        self.username = username
        self.followerCount = followerCount
    }
}
