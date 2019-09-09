//
//  SigninViewController.swift
//  WeatherOrNot
//
//  Created by Medi Assumani on 9/8/19.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import Foundation
import PromiseKit
import UIKit


class SigninViewController: UIViewController {
  
  
  let avatarImageView = UIImageView()
  let activityIndicator = UIActivityIndicatorView()
  
  override func viewDidLoad() {
    
    makeApiRequest()
  }
  
  func makeApiRequest() {
    
    firstly{
      UserHelper.shared.signin(username: "MediBoss", password: "123")
    }.then { user in
        UserHelper.shared.fetchUserAvatar(fromUrl: user.profileImageUrl!)
    }.done { avatar in
        self.avatarImageView.image = avatar
    }.ensure {
        self.activityIndicator.stopAnimating()
    }.catch { error in
        print(error.localizedDescription)
    }
  }
}
