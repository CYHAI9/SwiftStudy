//
//  AsyncViewController.swift
//  SwiftStudy
//
//  Created by ChenYinHai on 2017/12/14.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class AsyncViewController: UIViewController {

    let lock = NSLock()
    var num:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        asyncGCD()
        AsyncThread()
    }
    
    func asyncGCD() -> Void {
        //异步并行队列
        for i in (1...10) {
          
            DispatchQueue.global().async {
                print("线程\(Thread.current)==\(i)")
            }
           
        }
        sleep(1)
        for _ in (1...10) {
        
            DispatchQueue.global().async {
                self.syncDosomeThing02()
            }
           
        }
        Thread.sleep(forTimeInterval: 1)
        for _ in (1...10) {
            
            DispatchQueue.global().sync {
                syncDosomeThing()
            }
        }
    }

    
    func syncDosomeThing() -> Void {
        objc_sync_enter(self)
        print("同步锁线程==\(num)")
        num+=1
        objc_sync_exit(self)
    }
    func syncDosomeThing02() -> Void {
        lock.lock()
        print("同步锁线程==\(num)")
        num+=1
        lock.unlock()
    }
    
    func AsyncThread() -> Void {
        
        for i in (1...10) {
            
            let thread = Thread.init(target: self, selector:(#selector(AsyncViewController.ThreadDosmeThing)), object:["num":i])
            thread.start();
            
        }
        
        for _ in (1...10) {
            
            let thread = Thread.init(target: self, selector:(#selector(AsyncViewController.syncThreadDosomeThing)), object:nil)
            thread.start();
            
        }
        
    }
    
    func ThreadDosmeThing(thread:Thread) -> Void {
        
        print("Thread线程==\(thread.value(forKey:"num")!)")

    }
    
    func syncThreadDosomeThing() -> Void {
        lock.lock()
        print("同步Thread线程==\(num)")
        num+=1
        lock.unlock()
    }
}
