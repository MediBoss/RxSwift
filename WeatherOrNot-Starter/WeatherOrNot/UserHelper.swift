//
//  UserHelper.swift
//  WeatherOrNot
//
//  Created by Medi Assumani on 9/8/19.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import Foundation
import PromiseKit
import UIKit


struct User: Decodable {
  
  var name: String
  var password: String
  var profileImageUrl: String?
  
}
class UserHelper {
  
  static let shared = UserHelper()
  
  private func signin(username: String, password: String, completion: @escaping(User) -> ()) {
    
  }
  
  
  func signin() -> Promise<User> {
    
    let urlString = "https://api.lofti.com/signin"
    let url = URL(string: urlString)
    
    return firstly {
      URLSession.shared.dataTask(.promise, with: url!)
      }.compactMap {
        let decodedUser = try JSONDecoder().decode(User.self, from: $0.data)
        return decodedUser
    }
  }
  
  
  func fetchUserAvatar(fromUrl url: String) -> Promise<UIImage> {
    
    let queue = DispatchQueue.global(qos: .background)
    let url = URL(string: url)
    
    return firstly {
      
      URLSession.shared.dataTask(.promise, with: url!)
      }.compactMap(on: queue) {
        UIImage(data: $0.data)
    }
  }
  
  
  func doStuff() {
    
    signin().then { user in
      fetchUserAvatar(fromUrl: user.profileImageUrl!).map { ($0, user) }
      }.then {
        print($0.1.name)
    }
  }
}
