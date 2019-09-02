//
//  HomeViewController.swift
//  RxIntro
//
//  Created by Medi Assumani on 9/2/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

class HomeViewController: UIViewController {
    
    // MARK: UI COMPONENTS
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var currentUserLabel: UILabel!
    
    // MARK: PROPERTIES
    private let _userObservableDisposeBag = DisposeBag()
    private var _currentUser = User(username: "Medi Assumani", followerCount: 0)
    
    var users = Observable.just(
    
        [
            User(username: "Jamar", followerCount: 0),
            User(username: "Lofi", followerCount: 0),
            User(username: "May", followerCount: 0),
            User(username: "Champaingn Papi", followerCount: 0),
            User(username: "Log", followerCount: 0),
            User(username: "Triple H", followerCount: 0),
            User(username: "King4", followerCount: 0),
            User(username: "E40", followerCount: 0)
        ]
    )
    
    // MARK: INITIALIZERS
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureReactiveTableView()
        
    }
}

// RX Extension Configs
extension HomeViewController {
    
    private func configureReactiveTableView(){
       
        // Configuring data displayed on each cell
        users
            .bind(to: mainTableView.rx
                .items(cellIdentifier: HomeTableViewCell.cellID, cellType: HomeTableViewCell.self)) {
                    
                    (row, user, cell) in
                        cell.configureCell(withUser: user)
            }
            .disposed(by: _userObservableDisposeBag)
        
        // Configuring when cell is selected
        mainTableView.rx
            .modelSelected(User.self)
            .subscribe(onNext: { [unowned self] user in
                
                if let selectedRowIndexPath = self.mainTableView.indexPathForSelectedRow {
                    
                    self.mainTableView.deselectRow(at: selectedRowIndexPath, animated: true)
                }
                
                self._currentUser.followerCount += 1
                self.followingLabel.text = String(self._currentUser.followerCount)
            })
            .disposed(by: _userObservableDisposeBag)
    }
}
