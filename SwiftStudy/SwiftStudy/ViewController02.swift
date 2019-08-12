//
//  ViewController02.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/8/30.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class ViewController02: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var alterView:UIAlertController!
    var myTableview:UITableView!
    let dataSource:Array = ["视频","音频"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fixUi()
    }
 
    func fixUi() -> Void {
        
        self.myTableview = UITableView.init(frame: self.view.frame, style: UITableView.Style.plain)
        self.myTableview.delegate = self
        self.myTableview.dataSource = self
        self.view.addSubview(self.myTableview)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        let action = UIAlertAction.init(title: "确定", style:.default) { (alAction) in
//            //do something
//        }
//        if (alterView == nil) {
//
//            alterView = UIAlertController.init(title: "尚未挖掘，后续", message: nil, preferredStyle: .alert)
//            alterView.addAction(action)
//        }
//
//        self.present(alterView, animated: true) {
//         //do something
//        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellid")
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cellid")
        }
        cell?.textLabel?.text = self.dataSource[indexPath.row];
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row==0 {
            var vcv = VideoController.init()
            self.navigationController?.pushViewController(vcv, animated: true)
            
        }
    }
    
}
