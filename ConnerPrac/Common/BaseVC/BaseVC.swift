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

    
    public var disposeBag = DisposeBag()

    
    deinit {
        print(type(of: self).description())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingSubviews()
    }
    
    private func settingSubviews() {
        self.view.do {
            $0.backgroundColor = .init(hexString: "F7F7F7")
        }
    }
}
