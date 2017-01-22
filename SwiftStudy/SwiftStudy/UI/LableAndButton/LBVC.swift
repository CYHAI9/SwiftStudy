//
//  LBVC.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/1/18.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class LBVC: UIViewController {
    var label01 = UILabel()
    var Button01 = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
    self.createrUI()
    }
    func createrUI() -> Void {
        self.label01 = UILabel.init(frame: CGRect(origin:CGPoint(x:100,y:100),size:CGSize(width:200, height:100)))
        self.label01.backgroundColor = UIColor.orange
        self.label01.text = "创建一个Label"
        self.label01.textAlignment = NSTextAlignment.center;
        self.label01.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(label01)
        
        self.Button01 = UIButton.init(frame: CGRect(origin:CGPoint(x:100,y:300),size:CGSize(width:200,height:64)))
        self.Button01.backgroundColor = UIColor.black
        self.Button01.addTarget(self, action:#selector(bBlicked(btn:)), for: .touchUpInside)
        self.Button01.setTitle("按钮", for: .normal)
        self.view.addSubview(Button01)
    }
    
    func bBlicked(btn:UIButton) -> Void {
        
        print("按钮响应 ")
        
    }
   
}
