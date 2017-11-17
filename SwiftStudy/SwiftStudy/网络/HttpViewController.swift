//
//  HttpViewController.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/11/16.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit
import Alamofire//如若显示未找到，可先无视，com+b 能success就OK

let run = 0
class HttpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
        if (run == 1) {
            let params = Params()
            params.productKey = "NbaCTweebfe501e1e2b2d3a9a88ba374d88f584432c1ee7"
            params.area = "广州"
            
            HttpManager.POSTRequestSession(urlstr:"http://apis.eolinker.com/common/weather/get15DaysWeatherByArea", parameters:["productKey":params.productKey!,"area":params.area!], Success: { (response) in
                
                let dict = response as? NSDictionary
                if (dict == nil)
                {
                    return;
                }
                print("原生请求返回数据",dict!)
                
            }) { (error) in
                
                print("请求出错",error)
                
            }
            
        } else
        {
            AlamofireHttp()

        }
        
}
//TODO:第三方网络请求
    func AlamofireHttp() -> Void {
        let params = Params()
        params.productKey = "NbaCTweebfe501e1e2b2d3a9a88ba374d88f584432c1ee7"
        params.area = "广州"
        Alamofire.request("http://apis.eolinker.com/common/weather/get15DaysWeatherByArea", method: .post, parameters: ["productKey":params.productKey!,"area":params.area!], encoding:URLEncoding.default, headers: nil).responseJSON { (response) in
            
            print("第三方请求的返回数据",response);
        }
        
    }
    
    
}



