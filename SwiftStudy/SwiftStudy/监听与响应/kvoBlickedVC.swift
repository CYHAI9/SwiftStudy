//
//  kvoBlickedVC.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/1/16.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class kvoBlickedVC: UIViewController {
    var btn01:UIButton?
    var tapGeview:UIView?
    var kvoer:kvcPer?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.createrUI()
    }

    func createrUI() -> Void {
        self.btn01 = UIButton.init(frame:CGRect(origin: CGPoint(x:100,y:100),size: CGSize(width:200,height:40)))
        btn01?.backgroundColor = UIColor.black;
        self.view.addSubview(self.btn01!);
        btn01?.addTarget(self, action:#selector(blicked(btn:)), for: .touchUpInside)
        self.tapGeview = UIView.init(frame: CGRect(origin:CGPoint(x:100,y:200),size:CGSize(width:200, height:100)));
        let tapGe:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action:#selector(tapGeBlicked(tap:)))
        self.tapGeview?.addGestureRecognizer(tapGe)
        self.tapGeview?.backgroundColor = UIColor.orange
        self.view.addSubview(self.tapGeview!)
        self.kvoer = kvcPer();
        self.kvoer?.addObserver(self, forKeyPath:"kvotest", options: .new, context:nil)
    }

    @objc func blicked(btn:UIButton) -> Void {
        print("swift是那么坑")
        self.kvoer?.setValue("黑色按钮响应监听", forKey: "kvotest")
    }
    
    @objc func tapGeBlicked(tap:UITapGestureRecognizer) -> Void {
        print("手势单击")
        kvoer?.setValue("手势单击响应监听", forKeyPath: "kvotest")
       
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
      
        if keyPath == "kvotest" {
            print("kvo监听\(String(describing: kvoer?.kvotest))")
        }
        
        if (object as? kvcPer == kvoer) {
            print("kvo监听xxxxxxx")
        } else {
            
        }
        
    }
    //等同于dealloc
    deinit {
        
       self.kvoer?.removeObserver(self, forKeyPath: "kvotest")
        
    }
}
