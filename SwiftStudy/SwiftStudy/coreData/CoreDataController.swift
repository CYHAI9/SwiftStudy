//
//  CoreDataController.swift
//  SwiftStudy
//
//  Created by ChenYinHai on 2018/10/10.
//  Copyright © 2018年 陈海哥. All rights reserved.
//

import UIKit
class CoreDataController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CoredataManager.manager.createCoreData(coredataName: "SwiftCoreDataModel")
        self.createUI();
    }
    
    func createUI() -> Void {
        
        let inserBtn = UIButton.init(frame:CGRect(origin: CGPoint(x: self.view.center.x-27, y: 84), size: CGSize(width: 100, height: 54)))
        inserBtn.setTitle("插入数据", for:.normal)
        inserBtn.backgroundColor = UIColor.black;
        
        let selectBtn = UIButton.init(frame:CGRect(origin: CGPoint(x: self.view.center.x-27, y: 150), size: CGSize(width: 100, height: 54)))
        selectBtn.setTitle("查询数据", for:.normal)
        selectBtn.backgroundColor = UIColor.black;
        
        let deletetBtn = UIButton.init(frame:CGRect(origin: CGPoint(x: self.view.center.x-27, y: 224), size: CGSize(width: 100, height: 54)))
        deletetBtn.setTitle("删除数据", for:.normal)
        deletetBtn.backgroundColor = UIColor.black;
        
        let updatetBtn = UIButton.init(frame:CGRect(origin: CGPoint(x: self.view.center.x-27, y: 298), size: CGSize(width: 100, height: 54)))
        updatetBtn.setTitle("更改数据", for:.normal)
        updatetBtn.backgroundColor = UIColor.black;
        
        inserBtn.addTarget(self, action:#selector(CoreDataController.testCoredata(btn:)), for:.touchUpInside)
        selectBtn.addTarget(self, action:#selector(CoreDataController.testCoredata(btn:)), for:.touchUpInside)
        deletetBtn.addTarget(self, action:#selector(CoreDataController.testCoredata(btn:)), for:.touchUpInside)
        updatetBtn.addTarget(self, action:#selector(CoreDataController.testCoredata(btn:)), for:.touchUpInside)
        inserBtn.tag = 10;
        selectBtn.tag = 11;
        deletetBtn.tag = 12;
        updatetBtn.tag = 13;
        
        self.view.addSubview(inserBtn)
        self.view.addSubview(selectBtn)
        self.view.addSubview(deletetBtn)
        self.view.addSubview(updatetBtn)
        
    }
    
    @objc func testCoredata(btn:UIButton) -> Void {
     
        switch btn.tag {
        case 10:
            //插入数据
            CoredataManager.manager.inserDataWithClassName(ClassName: "CoredataTest") { (model) -> Void in
                let coredataModel:CoredataTest? = model as? CoredataTest
                coredataModel?.age = 30
                coredataModel?.name = "join"
                coredataModel?.photo = 12345678901
                //            coredataModel = nil
            }
            break;
        case 11:
            //查询数据
            CoredataManager.manager.selectDataWithCalssName(className: "CoredataTest", whereString: "age = 30") { (Datas) in
                
                let arr:Array = Datas as! Array<Any>
                for model in arr as! [CoredataTest]
                {
                    print("数据源:\(model.age)\n\(model.name ?? "")\n\(model.photo)")
                }
            }
            break;
        case 12:
            //删除数据
            CoredataManager.manager.deleDataWithClassName(className: "CoredataTest", whereString: "name = 'join' and age = 30") { (model) in
                
            }
            break;
        case 13:
            //更新数据
            CoredataManager.manager.updateDataWithClassName(className: "CoredataTest", whereString: "name = 'join' and age = 30") { (Datas) in
                
                let arr:Array = Datas as! Array<Any>
                for model in arr as! [CoredataTest]
                {
                    model.name = "小米"
                }
            }
            break;
        default:
            break;
        }
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
