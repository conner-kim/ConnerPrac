//
//  BaseTabbar.swift
//  ConnerPrac
//
//  Created by Conner on 2022/10/20.
//

import UIKit

class BaseTabBar: UITabBar {
    
    private var shareLayer: CALayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.settingSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.settingSubviews()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    private func settingSubviews() {
        self.backgroundColor = .init(hexString: "ffffff")
        self.backgroundImage = UIImage()
        self.layer.cornerRadius = 16
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.layer.masksToBounds = true
        self.makeShadow()
    }
    
    private func makeShadow(){
        self.shadowImage = UIImage()
    }

//    open override func sizeThatFits(_ size: CGSize) -> CGSize {
//
//        var newSize = size
//
////        newSize.height = 60
//        return newSize
//    }
}
