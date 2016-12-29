//
//  ViewController.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2016/12/28.
//  Copyright © 2016年 陈海哥. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,myDelegate {
    
    var Mytableview = UITableView()
    var mydatasource = NSMutableArray()
    var protocol02: String = "哇哈哈哈"
    var structTest01 = protocol03()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.datasource()
        //初始化一个tableview，分类方便调试
        self.Mytableview = UITableView(frame: self.view.frame, style: UITableViewStyle.plain)
        self.Mytableview.delegate = self
        self.Mytableview.dataSource = self;
        self.view.addSubview(self.Mytableview);
        
//        NotificationCenter.default.addObserver(self, selector: #selector(test1), name: NSNotification.Name(rawValue: "test1"), object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(test1(notification:)), name: NSNotification.Name("test1"), object: nil)
    }
    
    func test1(notification:NSNotification) -> Void {
        let userinfo = notification.userInfo as![String:AnyObject]
        
        print("这是个通知:",userinfo["通知"] as!String)
    }
    //等同于dealloc
    deinit {
        
        NotificationCenter.default.removeObserver(self)
        

    }
    
    func datasource() -> Void {
        self.mydatasource = NSMutableArray.init(array: ["基础","运算符","字符串","协议与通知","控制流","函数","闭包"])
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.mydatasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var mytableviewcell = tableView.dequeueReusableCell(withIdentifier:"cell01")
        if (mytableviewcell == nil) {
            
            mytableviewcell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell01")
        }
        
        mytableviewcell?.textLabel?.text = self.mydatasource[indexPath.row]as?String//用问号表示可能为空，不过能到这里一般不会出现这种情况，Label.text属性要求，更严谨些
        
        return mytableviewcell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //控制流，switch
        switch indexPath.row {
        case 0:
            let bvc = BaseVc()
            self.navigationController?.pushViewController(bvc, animated: true)
        break
        case 1:
            let cavc = calculationsVC()
            self.navigationController?.pushViewController(cavc, animated: true)
            
        break
        case 2:

        break
        case 3:
            let pvc = ProNotifiVC()
            pvc.testdelegate = self;
            let stru = protocol03()
            stru.protocol01(str:"结构体传入")
            print(protocol02)
            self.navigationController?.pushViewController(pvc, animated: true)
        break
        case 4:
            
        break
        case 5:
            
        break
        case 6:
            let blvc = BlockVC()
            blvc.block01(str:"传值", block: { (str) in
                
                print("读取block回调的东西\(str)")
            })
            
            blvc.block02 = {
                (str:String,str2:String) in
               
                print(str+str2)
            
            }
            blvc.block03 = {
                (str:String) in
                
                print(str)
                
            }
            
            blvc.block04(str:"第四种block使用", block: { (str) in
                print(str)
            })
            
            self.navigationController?.pushViewController(blvc, animated:true)
        break
        case 7:
            
        break
        default: break
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }

    func protocol01(str: String) {
        print("协议：",str)
        
    }
  
    
}



