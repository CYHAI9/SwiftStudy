//
//  ImageVC.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/1/18.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class ImageVC: UIViewController {
    var imageview01 = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.createrUI()
    }
    
    func createrUI() -> Void {
        self.imageview01 = UIImageView.init(frame: CGRect(origin:CGPoint(x:100,y:300),size:CGSize(width:200,height:200)))
        self.imageview01.image = UIImage.init(imageLiteralResourceName: "通用图标.jpg")
        self.view.addSubview(imageview01)
        
    }
    
    
}
