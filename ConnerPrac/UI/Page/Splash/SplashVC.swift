//
//  SplashVC.swift
//  ConnerPrac
//
//  Created by Conner on 2022/10/19.
//

import UIKit

class SplashVC: BaseVC {
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingSubviews()
        self.bindUserEvents()
    }
    
    
    private func settingSubviews() {
        self.nextButton.do {
            $0.setTitle("다음으로", for: .normal)
            $0.backgroundColor = .init(hexString: "815854")
            $0.setTitleColor(.init(hexString: "F9EBDE"), for: .normal)
            $0.layer.cornerRadius = 8

        }
    }
    
    private func bindUserEvents() {
        
    }
}
