//
//  ViewController02.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/8/30.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class ViewController02: UIViewController {

    var alterView:UIAlertController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    override func viewWillAppear(_ animated: Bool) {
        
        let action = UIAlertAction.init(title: "确定", style:.default) { (alAction) in
            //do something
        }
        if (alterView == nil) {
          
            alterView = UIAlertController.init(title: "尚未挖掘，后续", message: nil, preferredStyle: .alert)
            alterView.addAction(action)
        }
        
        self.present(alterView, animated: true) {
         //do something
        }
    }

}
