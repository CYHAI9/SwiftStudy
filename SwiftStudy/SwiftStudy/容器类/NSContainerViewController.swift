//
//  NSContainerViewController.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/11/20.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class NSContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ArraryClass()
        DictionaryClass()
    }
    
    func ArraryClass() -> Void {
        let Arr:Array = ["数组元素1","数组元素2","数组元素3"]
        let muArr = NSMutableArray()
        for arrStr:String in Arr {
            
            muArr.add(arrStr)
        }
        
        print(muArr)
        //TODO:拼接
        let string_com:String = muArr.componentsJoined(by: ",")
        print("数组字符串拼接\n",string_com)
        //TODO:移除
        muArr.removeObject(at: 1)
        print("数组移除相应下标元素\n",muArr)
        muArr.removeAllObjects()
        //TODO:分离
        muArr.addObjects(from: string_com.components(separatedBy: ","))
        
        //TODO:结合enumerate()遍历数组
        for (index,item) in muArr.enumerated() {
            
            print("enumerate遍历数组：下标:\(index)  元素:\(item)")
            
        }
    }

    func DictionaryClass() -> Void {
        
        let diction:Dictionary = ["key1":"values1","key2":"values2","key3":"values3"]
        let muDition = NSMutableDictionary()
        
        for key:String in diction.keys {
            muDition.setValue(diction[key], forKey: key)
        }
        
        print("字典：",muDition)
        //TODO:一个特定类型字典
        var dictionIS :[Int:String] = [1:"固定类型1",2:"固定类型2",3:"固定类型3"]
        print("特定类型字典:\(dictionIS[1]!)")
        
        //TODO:遍历字典
        for (key,values) in dictionIS {
            print("key=\(key)  values\(values)")
        }
        
    }

    
}
