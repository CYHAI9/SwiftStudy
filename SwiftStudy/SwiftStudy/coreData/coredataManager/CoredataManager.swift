//
//  CoredataManager.swift
//  SwiftStudy
//
//  Created by ChenYinHai on 2018/10/10.
//  Copyright © 2018年 陈海哥. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class CoredataManager: NSObject {

    static var manager = CoredataManager()
    var mainMoc:NSManagedObjectContext!
    var backgroundMOC:NSManagedObjectContext!
    var psc:NSPersistentStoreCoordinator!
    private override init() {
        
    }
   
    
    func createCoreData(coredataName:String) -> Void {
        
        self.psc = self.setStoreCoordinatorwithResourceName(name:coredataName)
        self.mainMoc = NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
        self.backgroundMOC = NSManagedObjectContext.init(concurrencyType: .privateQueueConcurrencyType)
        self.backgroundMOC.parent = self.mainMoc
    
        self.backgroundMOC.perform({
            
            do{
                try self.backgroundMOC.save()
            }catch let error{
                print("数据库创建异常001处:",error);
            }
            
            self.mainMoc.perform({
                do{
                    try self.mainMoc.save()
                }catch let error{
                    print("数据库创建异常002处:", error);

                }
            })
            
        })
    }
    
    func setStoreCoordinatorwithResourceName(name:String) -> NSPersistentStoreCoordinator {
        
        let modelPath:URL = Bundle.main.url(forResource: name, withExtension: "momd")!
        let model:NSManagedObjectModel = NSManagedObjectModel.init(contentsOf: modelPath)!
        
        // 根据指定的路径，创建并关联本地数据库

        psc = NSPersistentStoreCoordinator.init(managedObjectModel: model)
        var dataPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        print("路径：" + dataPath)
        dataPath.append("/coreDataTest.sqlite")

        do {
            try psc.addPersistentStore(ofType:NSSQLiteStoreType, configurationName: nil, at: URL.init(fileURLWithPath: dataPath), options: nil)
        } catch let error {
            
            print("出现异常:",error);
        }
        
        return psc
        
    }
    
    
    func inserDataWithClassName(ClassName:String,createModelReturnBlock:(Any) -> Void) -> Void {
        let mainMOC = NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
        mainMOC.persistentStoreCoordinator = psc;
        let backgMOC = NSManagedObjectContext.init(concurrencyType: .privateQueueConcurrencyType)
        backgMOC.parent = mainMOC
        let modelObject = NSEntityDescription.insertNewObject(forEntityName:ClassName, into: backgMOC)
            createModelReturnBlock(modelObject)
        backgMOC.perform {
            do{
                try backgMOC.save()
            }catch let error{
                print("插入数据异常001:",error)
            }
            mainMOC.perform({
                do{
                    try mainMOC.save()
                }catch let error{
                    print("插入数据异常002:",error)
                }
            })
        }
        
    }
    
    func selectDataWithCalssName(className:String,whereString:String?,reslutBlock:@escaping (Any) ->Void) -> Void {
       
        let mainMOC = NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
        mainMOC.persistentStoreCoordinator = psc;
        let backgMOC = NSManagedObjectContext.init(concurrencyType: .privateQueueConcurrencyType)
        backgMOC.parent = mainMOC
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: className)
        if (whereString != nil && (whereString?.count)! > 0){
            let pre = NSPredicate.init(format: whereString!, argumentArray: nil)
            request.predicate = pre
        }
        
        backgMOC.perform {
            mainMOC.perform({
                do {
                    let arrDatas = try backgMOC.fetch(request)
                    
                    reslutBlock(arrDatas)
                }
                catch let error{
                    print("查询异常",error)
                }
               
            })
        }
        
    }
    
    func deleDataWithClassName(className:String,whereString:String?,reslutBlock:@escaping (Bool) ->Void) -> Void{
        
        let mainMOC = NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
        mainMOC.persistentStoreCoordinator = psc;
        let backgMOC = NSManagedObjectContext.init(concurrencyType: .privateQueueConcurrencyType)
        backgMOC.parent = mainMOC
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: className)
        if (whereString != nil && (whereString?.count)! > 0){
            let pre = NSPredicate.init(format: whereString!, argumentArray: nil)
            request.predicate = pre
        }
            let asyncFetchRequest = NSAsynchronousFetchRequest(fetchRequest: request, completionBlock: { (result:NSAsynchronousFetchResult) in
                let fetchObject = result.finalResult! as! [NSManagedObject]
                for c in fetchObject{
                    //所有删除信息
                    backgMOC.delete(c)
                    do{
                        try backgMOC.save()
                        try mainMOC.save()

                    }catch let error{

                        print("删除error",error)
                    }
                }
                reslutBlock(true)
            })

            backgMOC.perform {
        
              mainMOC.perform({
                do{
                    try backgMOC.execute(asyncFetchRequest)
                    //
                }catch let error{
                    //
                    print("删除error",error)
                }
        
                })

            }
        
    }
    
    func updateDataWithClassName(className:String,whereString:String?,reslutBlock:@escaping (Any) ->Void) -> Void{
        
        let mainMOC = NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
        mainMOC.persistentStoreCoordinator = psc;
        let backgMOC = NSManagedObjectContext.init(concurrencyType: .privateQueueConcurrencyType)
        backgMOC.parent = mainMOC
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: className)
        if (whereString != nil && (whereString?.count)! > 0){
            let pre = NSPredicate.init(format: whereString!, argumentArray: nil)
            request.predicate = pre
        }
        
        backgMOC.perform {
            mainMOC.perform({
                do {
                    let arrDatas = try backgMOC.fetch(request)
                    reslutBlock(arrDatas)
                    try backgMOC.save()
                    try mainMOC.save()
                }
                catch let error{
                    print("查询异常",error)
                }
                
            })
        }
    }
    
}


