//
//  ViewController.swift
//  ConnerPrac
//
//  Created by Conner on 2022/09/21.
//

import Foundation

import UIKit
import FirebaseDynamicLinks
import RxSwift
import RxCocoa
import Alamofire


class ViewController: UIViewController {
    
    @IBOutlet weak var linkLB: UILabel!
    @IBOutlet weak var nextViewBTN: UIButton!
    @IBOutlet weak var downloadBTN: UIButton!
    
    private let disposed = DisposeBag()
    private var dynamicLinkUrl: String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        self.view.backgroundColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        
        self.linkLB.textColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        self.linkLB.numberOfLines = 0
        self.linkLB.enableCopyOnTouch {[weak self] in
            guard let self = self else {
                return
            }
        }
        //        self.makeDynamicLink()
        
        self.nextViewBTN
            .rx
            .tap
            .asDriver()
            .drive(onNext: {[weak self] in
                
                guard let self = self else {
                    return
                }
                
                self.makeDynamicLink()
            })
            .disposed(by: self.disposed)
        
        self.downloadBTN
            .rx
            .tap
            .asDriver()
            .drive(onNext: {[weak self] in
                
                guard let self = self else {
                    return
                }
                
                self.downTest()
                
            })
            .disposed(by: self.disposed)
        
        self.downloadBTN.setTitleColor(.init(red: 0, green: 255, blue: 0, alpha: 1), for: .normal)
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
    func downTest() {
        // ?????? ???????????????????????? ????????? ???????????? ??????
        let zipUrl = "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-zip-file.zip"
        let pdfUrl = "https://www.orimi.com/pdf-test.pdf"
        let url = zipUrl
        // ???????????????
        let fileManager = FileManager.default
        // ??? ??????
        let appURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        // ???????????? url ??? ??? ??? ??????????????? ?????? (50MB.zip)
        let fileName = NSString(string: url).lastPathComponent
        // ?????? ?????? ??????
        let fileURL = appURL.appendingPathComponent(fileName)
        // ?????? ?????? ?????? ??? ???????????? ?????? ?????? ( ?????? ?????? ?????? , ???????????? ?????? )
        let destination: DownloadRequest.Destination = { _, _ in
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        // ???????????? ??????
        AF.download(url, method: .get, parameters: nil, encoding: JSONEncoding.default, to: destination).downloadProgress { (progress) in
            // ??? ???????????? ??????????????? ??????
            
            print(progress)
        }.response{ response in
            if response.error != nil {
                print("?????????????????? ??????")
            }else{
                // ?????? ??????
                if let urlString = response.fileURL?.absoluteString,
                   let newURL = URL(string: "shareddocuments://\(urlString)"),
                   UIApplication.shared.canOpenURL(newURL) {
                    UIApplication.shared.open(newURL)
                }
                
                print("?????????????????? ??????")
            }
        }
    }
}

