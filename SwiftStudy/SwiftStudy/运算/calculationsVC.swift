//
//  calculationsVC.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2016/12/28.
//  Copyright © 2016年 陈海哥. All rights reserved.
//

import UIKit

class calculationsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.calculation01()
        self.calculation02()
        self.calculation03()
        self.calculation04()

    }
   //加减
    func calculation01() -> Void {
        let b = 10
        var a = 5
        a = b
        // a 现在等于 10
        let (x,y) = (1,3)
        //x=1,y=3
        let z = x + y
        //字符串的拼接
        let str01 = "哈哈哈哈哈"+"嘻嘻嘻嘻"
        let str02 = str01.appending("再追加")
        print("z的值：\(z)\nstr02：\(str02)")
        
    }
    //乘除
    func calculation02() -> Void {
        let a = 6
        let b = 4
        let c = a%b//求余
        print("求余：\(c)")
        
        let x = 2
        let y = -x
        let z = -y
        //负负为正
        print("负负为正:",z,"后面再加")//其实也可以这样打印
    
        
    }
    
    ///比较
    func calculation03() -> Void {
       //Swift 也提供恒等（===）和不恒等（!==）
        let hello = "Hello!"
        let hello2 = "Hello!"
        if hello == hello2 {
            
            print("这里相等")
        }
        else
        {
           print("不相等")
        }
        
        if (!hello2.isEmpty){
         
            print("不为空")
        }
    }
    
    /// 三目运算符
    func calculation04() -> Void {
        let a = 3;
        let b = 4;
        let num = a>b ? a:b//这里要注意？间的空格
        
        print("三目运算符：\(num)")
        
    }
    
    
    /// 与或关系
    func calculation05() -> Void {
       
        let enteredDoorCode = true
        let passedRetinaScan = false
        if enteredDoorCode && passedRetinaScan {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
        
        let hasDoorKey = false
        let knowsOverridePassword = true
        if hasDoorKey || knowsOverridePassword {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
        //加括号可以处理优先级的问题
        if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
    }
    
    
}
