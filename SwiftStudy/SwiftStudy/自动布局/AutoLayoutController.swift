//
//  AutoLayoutController.swift
//  SwiftStudy
//
//  Created by ChenYinHai on 2018/1/10.
//  Copyright © 2018年 陈海哥. All rights reserved.
//

import UIKit
import SnapKit

class AutoLayoutController: UIViewController {

    let view01 = UIView()
    let view02 = UIView()
    let view03 = UIView()
    var view04:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }

    func createUI() -> Void {
        
        view01.backgroundColor = UIColor.orange
        view02.backgroundColor = UIColor.red
        view03.backgroundColor = UIColor.yellow
        self.view.addSubview(view01)
        self.view.addSubview(view02)
        self.view.addSubview(view03)
        view01.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(88)
            make.right.equalTo(view02.snp.left).offset(-10)
            make.bottom.equalTo(self.view.snp.centerY)
        }
        view02.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.equalTo(view01)
            make.bottom.equalTo(self.view.snp.centerY)
            make.width.equalTo(view01.snp.width).multipliedBy(0.5)
        }
        view03.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.bottom.right.equalTo(-10)
            make.top.equalTo(view02.snp.bottom).offset(10)
        }
        
    }

}
