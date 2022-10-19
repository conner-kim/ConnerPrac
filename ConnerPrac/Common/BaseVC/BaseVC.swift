//
//  BaseVC.swift
//  ConnerPrac
//
//  Created by Conner on 2022/10/19.
//

import UIKit
import RxSwift
import RxCocoa
import Then

class BaseVC: UIViewController {

    
    deinit {
        print(type(of: self).description())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
