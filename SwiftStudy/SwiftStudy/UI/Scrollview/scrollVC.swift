//
//  scrollVC.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/1/18.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class scrollVC: UIViewController,UIScrollViewDelegate {
    var scrollview01 = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createrUI()
    }
    
    func createrUI() -> Void {
        self.scrollview01 = UIScrollView.init(frame: CGRect(origin:CGPoint(x:0,y:0),size:CGSize(width:self.view.frame.size.width, height:self.view.frame.size.width)))
        self.scrollview01.contentSize = CGSize(width:3 * self.view.frame.size.width, height:0)
        self.scrollview01.contentOffset = CGPoint(x:0,y:0)
        self.view.addSubview(self.scrollview01)
        for i in (0...2){
            let imgeview01 = UIImageView.init(frame: CGRect(origin:CGPoint(x:(CGFloat(i)*self.view.frame.size.width),y:0),size:CGSize(width:self.view.frame.size.width, height:self.view.frame.size.width)))
            imgeview01.image = UIImage.init(imageLiteralResourceName: "通用图标.jpg")
            self.scrollview01.addSubview(imgeview01)
            self.scrollview01.isPagingEnabled = true;
        }
        
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("开始拖拽")
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("缓冲减速结束")
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("时刻监听")
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("结束拖拽")
    }

}
