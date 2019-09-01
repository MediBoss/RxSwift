//
//  ViewController.swift
//  RxIntro
//
//  Created by Medi Assumani on 8/28/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import RxSwift
import UIKit


class ViewController: UIViewController {

    let fibSequence = Observable.from([0,1,1,2,3,5,8]).filter({ $0 % 2 != 0})
    let bag = DisposeBag()
    
    @IBOutlet weak var counterLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let subscription = fibSequence.subscribe { (event) in
            
            switch event {
            case let .next(value):
                self.counterLabel.text = String(value)
                
            case .completed:
                print("completed")
                
            case .error(_):
                print("oops, error occured")
            }
        }
        subscription.disposed(by: bag)
    }
}

