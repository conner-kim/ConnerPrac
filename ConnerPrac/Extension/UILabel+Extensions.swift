//
//  UILabel+Extensions.swift
//  ConnerPrac
//
//  Created by Conner on 2022/09/21.
//

import Foundation
import UIKit

extension UILabel {
    func enableCopyOnTouch(completion: () -> Void) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(sender:))) // 터치 시 실행될 함수를 연결한다
        
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture) // tapGestureRecognizer를 라벨에 붙인다.
    }
    
    @objc
    private func labelTapped(sender: UITapGestureRecognizer) { // 라벨이 터치되었을 때 호출됨
        guard let label = sender.view as? UILabel else {
            return
        }
        UIPasteboard.general.string = label.text // 텍스트가 복사됨
        self.makeAlert(title: "다이나믹링크 복사", message: "다이나믹링크 주소를 클립보드에 저장했습니다.")
    }
    
    private func makeAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "", style: .default)
        alert.addAction(defaultAction)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
    }
}
