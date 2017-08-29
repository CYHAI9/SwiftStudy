//
//  emController.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/8/29.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

enum enumStudy {
    case enumone
    case enumTwo
    case enumThree
}

class emController: UIViewController {

    var enumexample:enumStudy!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.enumFun()
    }

    func enumFun() -> Void {
        let enumBtn:UIButton = UIButton.init(frame:CGRect(origin:CGPoint(x:100,y:100),size:CGSize(width:200, height:100)))
        enumBtn.setTitle("枚举", for:.normal)
        enumBtn.backgroundColor = UIColor.orange
        enumBtn.addTarget(self, action:#selector(enumBlicked(Btn:)), for: .touchUpInside)
        self.enumexample = .enumone
        
        self.view.addSubview(enumBtn);
        
    }
    func enumBlicked(Btn:UIButton) -> Void {
        
        switch self.enumexample! {
        case enumStudy.enumone:
            print("枚举01")
            
            break
        case enumStudy.enumTwo:
            print("枚举02")
            break
        case enumStudy.enumThree:
            print("枚举03")
            break
         
        }
        
        if self.enumexample == .enumone {
            
            self.enumexample = .enumTwo
        }
        else if self.enumexample == .enumTwo
        {
            self.enumexample = .enumThree
            
        }
        else
        {
            self.enumexample = .enumone
        }
        
    }
    
    
}
