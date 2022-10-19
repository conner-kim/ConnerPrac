//
//  FristVC.swift
//  ConnerPrac
//
//  Created by Conner on 2022/10/19.
//

import UIKit

class FirstVC: BaseVC {

    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.settingSubviews()
        self.bindUserEvents()
    }
    
    private func settingSubviews() {
        self.nextButton.do {
            $0.setTitle("상세로 이동", for: .normal)
            $0.backgroundColor = .init(hexString: "815854")
            $0.setTitleColor(.init(hexString: "F9EBDE"), for: .normal)
            $0.layer.cornerRadius = 8
        }
        
    }
    
    private func bindUserEvents() {
        
        self.nextButton
            .rx
            .tap
            .asDriver()
            .drive(onNext: {[weak self] in
                
                self?.navigationController?.pushViewController(DetailVC(), animated: true)
            })
            .disposed(by: self.disposeBag)
    }
}
