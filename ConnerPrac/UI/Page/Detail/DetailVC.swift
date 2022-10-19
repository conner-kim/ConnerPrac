//
//  DetailVC.swift
//  ConnerPrac
//
//  Created by Conner on 2022/09/21.
//

import UIKit

class DetailVC: ViewController {

    
    @IBOutlet weak var detailLB: UILabel!
    
    private var id: String? = nil
    convenience init(id: String?) {
        self.init(nibName: "DetailVC", bundle: nil)
        
        self.id = id
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.detailLB.text = id
    }
}
