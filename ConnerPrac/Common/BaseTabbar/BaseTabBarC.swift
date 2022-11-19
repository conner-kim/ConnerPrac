//
//  BaseTabbar.swift
//  ConnerPrac
//
//  Created by Conner on 2022/10/19.
//

import UIKit

class BaseTabBarC: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.hidesBottomBarWhenPushed = true
        
        self.settingController()
        self.settingTabbar()
        
        // 처음 selectedImage가 나오게 하고 싶어서 추가
        // 마음에 안드는 코드,,
        self.selectedIndex = 1
        self.selectedIndex = 0

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    private func settingTabbar() {
        
        self.setValue(BaseTabBar(), forKey: "tabBar")
    }
    
    private func settingController() {
        
        let firstTab = FirstVC()
        firstTab.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let secondTab = SecondVC()
        secondTab.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        let thirdTab = ThirdVC()
        thirdTab.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        
        self.viewControllers = [firstTab, secondTab, thirdTab]
    }
}

extension BaseTabBarC: UITabBarControllerDelegate {
    
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        UIApplication.getKeyWindow()?.rootViewController?.navigationController?.popToRootViewController(animated: false)
    }
}
