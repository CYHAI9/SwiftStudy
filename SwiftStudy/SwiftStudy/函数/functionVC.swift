//
//  functionVC.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/1/18.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class functionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func function01() -> Void {
        print("这个是对象函数")
    }
    
   class func function02() -> Void {
    
        print("这是类函数")
    
    }

}
