//
//  FoWhileVC.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2016/12/29.
//  Copyright © 2016年 陈海哥. All rights reserved.
//

import UIKit

class FoWhileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.forTest01()
        self.forTest02()
        self.whileTest01()
    }

    func forTest01() -> Void {
        
        let arr = ["01","02","03","04","05"]
        
        for  str:String in arr {
            
            print("for循环：\(str)")
            
        }
        
    }
    func forTest02() -> Void {
       
        for i in (0...10).reversed() {
            
            print("循环循序：",i)
        }
        
        
    }
    func whileTest01() -> Void {
        
        var i = 0;
        while i < 10 {
            print("while循环\(i)")
            i = i + 1;
        }
        
    }
}
