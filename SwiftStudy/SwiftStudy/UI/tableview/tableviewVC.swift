//
//  tableviewVC.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/1/19.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class tableviewVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableview01 = UITableView()
    var rowNum = 10;
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.createrUI()
    }
    
    func createrUI() -> Void {
        self.tableview01 = UITableView.init(frame: self.view.frame, style: .plain)
        self.view.addSubview(tableview01)
        self.tableview01.delegate = self;
        self.tableview01.dataSource = self;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowNum;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Cell01.cellinitWith(tableview: tableView, indexpath: indexPath)
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56.0
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        var action1:UITableViewRowAction
        var action2:UITableViewRowAction

//        if (indexPath.row%2 == 0) {
//            action = UITableViewRowAction.init(style: .default, title: "删除", handler: { (Taction, index) in
//
//                print("删除操作")
//                self.rowNum -= 1
//                self.tableview01.deleteRows(at:[indexPath], with: UITableViewRowAnimation.left)
//            })
//        }
//        else
//        {
//            action = UITableViewRowAction.init(style:.normal, title: "增加", handler: { (Taction, index) in
//                self.rowNum += 1
//                self.tableview01.insertRows(at:[indexPath], with: UITableViewRowAnimation.right)
//                print("添加操作")
//            })
//        }
        //TODO:以下是添加两个按钮在cell上
        action1 = UITableViewRowAction.init(style: .default, title: "删除", handler: { (Taction, index) in
            
            print("删除操作")
            self.rowNum -= 1
            self.tableview01.deleteRows(at:[indexPath], with: UITableView.RowAnimation.left)
        })
        action2 = UITableViewRowAction.init(style:.normal, title: "增加", handler: { (Taction, index) in
            self.rowNum += 1
            self.tableview01.insertRows(at:[indexPath], with: UITableView.RowAnimation.right)
            print("添加操作")
        })
        return [action1,action2]
    }
    
}
