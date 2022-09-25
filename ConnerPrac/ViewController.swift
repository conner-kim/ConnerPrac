//
//  ViewController.swift
//  ConnerPrac
//
//  Created by Conner on 2022/09/21.
//

import UIKit
import FirebaseDynamicLinks

class ViewController: UIViewController {

    @IBOutlet weak var linkLB: UILabel!
    @IBOutlet weak var nextViewBTN: UIButton!
    
    private var dynamicLinkUrl: String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        self.linkLB.numberOfLines = 0
        self.linkLB.enableCopyOnTouch {[weak self] in
            
            guard let self = self else {
                return
            }            
        }
        self.makeDynamicLink()
                
    }
    
    private func makeDynamicLink() {
        
        let linkUrlString = "https://connerprac.page.link/openapp?id=36788&screen=DOCTOR"
        let urlPrefix = "https://connerprac.page.link"
        let link = URL(string: linkUrlString)!
        if let linkBuilder = DynamicLinkComponents(link: link, domainURIPrefix: urlPrefix) {
            linkBuilder.iOSParameters = DynamicLinkIOSParameters(bundleID: "com.conner.prfirst")
            linkBuilder.iOSParameters?.appStoreID = "6443469581"
            
            if let longDynamicLink = linkBuilder.url {
                
                
            
                DynamicLinkComponents.shortenURL(longDynamicLink, options: nil, completion: {[weak self] url, warning, error in
                    
                    guard let self = self else {
                        return
                    }
                    
                    self.linkLB.text = url?.absoluteString
                    self.dynamicLinkUrl = url?.absoluteString
                })
            }
        }
    }
}

