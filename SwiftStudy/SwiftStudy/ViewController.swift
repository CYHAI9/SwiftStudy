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
        self.Mytableview = UITableView(frame: self.view.frame, style: UITableView.Style.plain)
        self.Mytableview.delegate = self
        self.Mytableview.dataSource = self;
        self.view.addSubview(self.Mytableview);
        
//        NotificationCenter.default.addObserver(self, selector: #selector(test1), name: NSNotification.Name(rawValue: "test1"), object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(test1(notification:)), name: NSNotification.Name("test1"), object: nil)
    }
    
    /// 通知
    ///
    /// - Parameter notification: <#notification description#>
    @objc func test1(notification:NSNotification) -> Void {
        let userinfo = notification.userInfo as![String:AnyObject]
        
        print("这是个通知:",userinfo["通知"] as!String)
    }
    //等同于dealloc
    deinit {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    func datasource() -> Void {
        self.mydatasource = NSMutableArray.init(array: ["基础","运算符","监听与响应","协议与通知","控制流","函数","闭包","UI","枚举","网络请求","容器类","地图","多线程","自动布局","coreData"])
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.mydatasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var mytableviewcell = tableView.dequeueReusableCell(withIdentifier:"cellId")
        if mytableviewcell == nil {
            
            mytableviewcell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell01")
        }
        
        mytableviewcell?.textLabel?.text = self.mydatasource[indexPath.row]as?String//用问号表示可能为空，不过能到这里一般不会出现这种情况，Label.text属性要求，更严谨些
        
        return mytableviewcell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //控制流，switch
        switch indexPath.row {
        case 0:
            let bvc = BaseVc()
            bvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(bvc, animated: true)
        break
        case 1:
            let cavc = calculationsVC()
            cavc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(cavc, animated: true)
            
        break
        case 2:
            let kvc = kvoBlickedVC()
            kvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(kvc, animated: true)
            
        break
        case 3:
            let pvc = ProNotifiVC()
            pvc.testdelegate = self;
            let stru = protocol03()
            stru.protocol01(str:"结构体传入")
            print(protocol02)
            pvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(pvc, animated: true)
        break
        case 4:
            let fvc = FoWhileVC()
            fvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(fvc, animated: true)
            
        break
        case 5:
           let fun01 = functionVC()
           fun01.function01()
           fun01.functionWithParam(str: "带参数的函数")
           var str = fun01.functionWithParamAndreturn(str: "返回函数")
           print(str)
           functionVC.function02()
           functionVC.functionWithParam(str: "带参数的类函数")
           str = functionVC.functionWithParamAndreturn(str: "带参数且返回函数")
           print(str)
           
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
            
            blvc.block06({ (str) in
                print(str)
                
            })
            blvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(blvc, animated:true)
        break
        case 7:
            let uvc = UIVC()
            uvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(uvc, animated:true)
        break
        case 8:
            let uvc = emController()
            uvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(uvc, animated:true)
            break
        case 9:
            let uvc = HttpViewController()
            uvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(uvc, animated:true)
            break
        case 10:
            let uvc = NSContainerViewController()
            uvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(uvc, animated:true)
            break
        case 11:
            let uvc = BaseMapViewController()
            uvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(uvc, animated:true)
            break
        case 12:
            let uvc = AsyncViewController()
            uvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(uvc, animated:true)
            break
        case 13:
            let uvc = AutoLayoutController()
            uvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(uvc, animated:true)
            break
        case 14:
            let uvc = CoreDataController()
            uvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(uvc, animated:true)
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



