//
//  HttpManager.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/11/16.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit

class HttpManager: NSObject {
    
    static var SessionManager = URLSession()

        private override init() {}
    
class func GetRequestSession(urlstr:String,parameters:NSDictionary?,Success:@escaping(_ response:Any) ->Void,Fail:@escaping(_ error:NSError) ->Void) -> Void {
    var _UrlStr:String = urlstr
    if (parameters != nil) {
        let JSONArr:NSMutableArray = NSMutableArray()
        for key:Any in (parameters?.allKeys)!
        {
            let JSONString = ("\(key)\("=")\(parameters![key] as! String)")
            JSONArr.add(JSONString)
        }
        let paramStr = JSONArr.componentsJoined(by:"&")
        _UrlStr.append("?"+paramStr)
        print("请求字符串"+_UrlStr)
    }
    let _url = URL.init(string:(_UrlStr.urlEncoded()))
    var urlRequest = URLRequest.init(url: _url!)
    urlRequest.httpMethod = "GET"
    
    let configuration:URLSessionConfiguration = URLSessionConfiguration.default
    HttpManager.SessionManager = URLSession(configuration: configuration)
    
    let task = HttpManager.SessionManager.dataTask(with:urlRequest){ (data, response, error) in
        
        //注意：当前这个闭包是在子线程中执行的，如果想要在这儿执行UI操作必须通过线程间的通信回到主线程
        if ((error) == nil)
        {
            if(data == nil)
            {
                return;
            }
            let jsonData = try!JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers)
            Success(jsonData);
            
        }
        else
        {
            Fail(error! as NSError)
            
        }

    }
    task.resume();
    }
    
    
    class func POSTRequestSession(urlstr:String,parameters:NSDictionary?,Success:@escaping(_ response:Any) ->Void,Fail:@escaping(_ error:NSError) ->Void) -> Void {
        
        let _UrlStr:String = urlstr
        
        let _url = URL.init(string:(_UrlStr.urlEncoded()))
        var urlRequest = URLRequest.init(url: _url!)
        urlRequest.httpMethod = "POST"
        let JSONArr:NSMutableArray = NSMutableArray()
        if (parameters != nil) {
            
            for key:Any in (parameters?.allKeys)!
            {
            let dictStr = "\(key)\("=")\(parameters!.value(forKey: key as! String)!)"
                JSONArr.add(dictStr)
            }
            urlRequest.httpBody = (JSONArr.componentsJoined(by: "&")).data(using: .utf8)
        }
        
        let configuration:URLSessionConfiguration = URLSessionConfiguration.default
        HttpManager.SessionManager = URLSession(configuration: configuration)
        
        let task = HttpManager.SessionManager.dataTask(with:urlRequest){ (data, response, error) in
            
            //注意：当前这个闭包是在子线程中执行的，如果想要在这儿执行UI操作必须通过线程间的通信回到主线程
            if ((error) == nil)
            {
                if(data == nil)
                {
                    return;
                }
                let jsonData = try!JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers)
                Success(jsonData);
            }
            else
            {
                Fail(error! as NSError)
                
            }
            
        }
        task.resume();
        
    }
}

extension String {
    
    //将原始的url编码为合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    
    //将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
}

}

