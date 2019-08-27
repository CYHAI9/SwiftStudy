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
        self.forAndenumTest02()
        switchTest(index: 200)
    }

    func forTest02() -> Void {
        
        let arr = ["01","02","03","04","05"]
        
        for  str:String in arr {
            print("for循环：\(str)")
        }
    }
    func forTest01() -> Void {
       
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
    
    func forAndenumTest02() -> Void {
        let arr = ["字符串01","字符串02","字符串03","字符串04"];
        for (index,str) in arr.enumerated().reversed() {
            print("下标：\(index)----元素：\(str)")
        }
    }
    
    func ifTest(istrue:Bool) -> Void {
        
        if istrue == true {
            print("这是真")
        }
        else
        {
            print("这是假")
        }
        
    }
    
    func switchTest(index:NSInteger) -> Void {
        
        switch index {
        case 100:
            let newIndex = index + 1;
            print("新下标:",newIndex)
            break;
        case 200:
            let newIndex = index + 1;
            print("新下标2:",newIndex)
            break;
        default:
            break;
        }
    }
}

