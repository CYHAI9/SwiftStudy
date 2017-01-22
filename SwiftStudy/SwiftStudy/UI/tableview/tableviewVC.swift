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
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Cell01.cellinitWith(tableview: tableView, indexpath: indexPath)
    
        return cell
        
    }
    
}
