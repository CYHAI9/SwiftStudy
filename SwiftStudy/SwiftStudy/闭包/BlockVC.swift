//
//  BlockVC.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2016/12/28.
//  Copyright © 2016年 陈海哥. All rights reserved.
//

import UIKit

func myblock(str:String) -> Void {
    
}

class BlockVC: UIViewController {

    /// 定义block属性的一种方法01：
    var block02 = {
        (str1:String,str2:String)in
        
    }
    var block03:(String)->Void = myblock
    var block05:(String)->Void = myblock
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.block02("block的属性","定义")
        self.block03("第三种block使用")
        self.block05("逃逸block")
    }

    /// 定义带有固定封闭的block的函数
    ///
    /// - Parameters:
    ///   - str: 传入值
    ///   - block: block
    func block01(str:String,block:(String) -> Void) ->Void {

        
        print(str)
        block("这是block")
//        self.block03 = block//这是不允许的，不允许将对象指向跳出函数
    }
    
    /// 定义可以逃逸闭包的block的函数
    ///
    /// - Parameters:
    ///   - str: 传入值
    ///   - block: block
    func block04(str:String,block:@escaping(String)-> Void) -> Void {
        
        print(str)
        self.block05 = block//@escaping可以让block的指向跳出函数
        
    }
    
}
