//
//  UIVC.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/1/18.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class UIVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var datasource = NSMutableArray()
    var uitableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createDataSource()
        self.createrUI()
    }
    
    func createDataSource() -> Void {
        self.datasource = NSMutableArray.init(array: ["Label与Button","UIImageview","Scrollview","Tableview","collectionview"])
    }
    
    func createrUI() -> Void {
        self.uitableview = UITableView.init(frame: self.view.frame, style: UITableView.Style.plain)
        self.uitableview.delegate = self;
        self.uitableview.dataSource = self;
        self.view.addSubview(self.uitableview);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var uicell = tableView.dequeueReusableCell(withIdentifier: "uicell")
        if (uicell != UITableViewCell()) {
            uicell = UITableViewCell.init(style: .default, reuseIdentifier: "uicell")
            uicell?.textLabel?.text = self.datasource[indexPath.row]as? String
        }
       
        return uicell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let lvc = LBVC()
            self.navigationController?.pushViewController(lvc, animated: true)
            break
        case 1:
            let ivc = ImageVC()
            self.navigationController?.pushViewController(ivc, animated: true)
            break
        case 2:
            let scvc = scrollVC()
            self.navigationController?.pushViewController(scvc, animated: true)
            break
        case 3:
            let tvc = tableviewVC()
            self.navigationController?.pushViewController(tvc, animated: true)
            
            break
        case 4:
            let cvc = CollectionviewController()
            self.navigationController?.pushViewController(cvc, animated: true);
        default: break
        
        }
        
    }

}
