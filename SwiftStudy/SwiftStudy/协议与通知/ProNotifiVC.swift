//
//  ProNotifiVC.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2016/12/29.
//  Copyright © 2016年 陈海哥. All rights reserved.
//

import UIKit

protocol myDelegate {
    
    func protocol01(str:String) ->Void
    var protocol02:String{get set}
    
}
struct protocol03: myDelegate {
    
    func protocol01(str: String) {
     
        print(str);
        
    }
    var protocol02: String = "喜啦啦啦啦"
}

class ProNotifiVC: UIViewController {
    var testdelegate:myDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.test01()
        
        let pro3 = protocol03()
        pro3.protocol01(str: "结构体2次传入")
        
    }

    func test01() -> Void {
       self.testdelegate?.protocol01(str: "这个是协议方法")
        
        NotificationCenter.default.post(name: NSNotification.Name("test1"), object: self, userInfo:["通知":"通知传值"])

    }
    
    
}
