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
        self.calculation03(num1: 5,num2: 6)
        self.calculation04()

    }
   //加减
    @objc func calculation01() -> Void {
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
        print("a的值：\(a) z的值：\(z)\nstr02：\(str02)")
        
    }
    //乘除
    func calculation02() -> Void {
        let a = 6
        let b = 4
        let s = a * b//相乘
        let c = a%b//求余
        let c1:Double = Double(a);
        let c2:Double = Double(b);
        
        print("相乘：\(s) 求余：\(c) 相除：\(c1/c2)")
        
        let x = 2
        let y = -x
        let z = -y
        //负负为正
        print("负负为正:",z,"后面再加")//其实也可以这样打印

    }
    
    ///比较
    func calculation03(num1:Int,num2:Int) -> Void {
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
        
        if num1 > num2{
            
            print("如果num1大于num2")
        }
        else
        {
            print("否则num1小于num2")
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
       
        let isOK = true
        let isNO = false
        if isOK && isNO {
            print("Welcome!")
        } else {
            print("not OK or NO")
        }
        
        let isNO2 = false
        let isOK2 = true
        if isOK2 || isNO2 {
            print("Welcome!")
        } else {
            print("not ok2 and no2")
        }
        //加括号可以处理优先级的问题
        if (isOK && isNO) || isOK2 || isNO2 {
            print("Welcome!")
        } else {
            print("not isok or isNO and isok2 and isno2")
        }
    }
    
    
}
