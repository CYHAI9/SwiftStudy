//
//  BaseVc.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2016/12/28.
//  Copyright © 2016年 陈海哥. All rights reserved.
//

import UIKit

class BaseVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.base01()
        self.base02()
        self.base03()
    }
    
    /// 声明常量和变量
    func base01() -> Void {
        let constantValue = 20
        let constantValue2 = "呼哈哈哈"
        let constantValue3 = true
        print("常量1：\(constantValue)\n常量2：\(constantValue2)\n常量3：\(constantValue3)")
        
        var varValue1 = 10
        var varValue2 = "呵呵呵呵呵"
        var varValue3 = true
        
        varValue1  = varValue1 + 1;
        varValue2.append("哈哈哈哈哈")
        varValue3 = false
        
        print("变量1：\(varValue1)\n变量2：\(varValue2)\n变量3：\(varValue3)")
        
    }
   
    /// 指定类型声明
    func base02() -> Void {
        var varValue1:String
        varValue1 = "西罗罗罗罗。。。"
        var varValue2:CGFloat
        varValue2 = 0.2
        
        let 奶牛:NSString
        奶牛 = "牛奶"
        let 😂 = "😂😂"
        
        print("变量2-1：\(varValue1)\n变量2-2：\(varValue2)\n常量2-1：\(奶牛)\n常量2-2：\(😂)")
        
    }

    /// 数据类型与转换
    func base03() -> Void {
        let Intvalue = 3
        let Dvalue = 0.1234
        let Dvalue02 = Double(Intvalue) + Dvalue//强转，不同类型是不允许相加的
        let valuestr = "12"
        let valueNum = NSInteger(valuestr)!//后面加!可以明确转化类型，不加打印是Optional(12)
        //其他类型转字符串
        let numstr = String(format:"第一种%lf",Dvalue)
        let numstr02 =  "\(Dvalue)\(valuestr)"
        
        print("转字符串01:",numstr)
        print("转字符串02",numstr02)
        print("double类型：\(Dvalue02)\n字符串转Int：\(valueNum)")

        
    }
    
}
