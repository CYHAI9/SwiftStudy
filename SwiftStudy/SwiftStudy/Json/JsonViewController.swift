//
//  JsonViewController.swift
//  SwiftStudy
//
//  Created by ChenYinHai on 2019/11/1.
//  Copyright © 2019 陈海哥. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import HandyJSON

class JsonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        swiftyJson()
        HandyJSON()
    }
    func swiftyJson() {
        let params = Params()
        params.productKey = "NbaCTweebfe501e1e2b2d3a9a88ba374d88f584432c1ee7"
        params.area = "广州"
        Alamofire.request("http://apis.eolinker.com/common/weather/get15DaysWeatherByArea", method: .post, parameters: ["productKey":params.productKey!,"area":params.area!], encoding:URLEncoding.default, headers: nil).responseJSON { (response) in
            let jsondata = JSON(response.data!)
            let model = JsonModel(jsonData: jsondata)
            
            for (index,subJson):(String, JSON) in jsondata["result"]["dayList"] {
            print("第三方请求的返回数据:",model.statusCode ?? "");
            }
            
            
        }
    }

    func HandyJSON() {
        let params = Params()
        params.productKey = "NbaCTweebfe501e1e2b2d3a9a88ba374d88f584432c1ee7"
        params.area = "广州"
        Alamofire.request("http://apis.eolinker.com/common/weather/get15DaysWeatherByArea", method: .post, parameters: ["productKey":params.productKey!,"area":params.area!], encoding:URLEncoding.default, headers: nil).responseJSON { (response) in
            let data = response.data
            do {
                let jsonmodel = try JSONSerialization.jsonObject(with: data ?? Data(), options: .mutableContainers) as? NSDictionary
                if let model = JsonModelHandy.deserialize(from: jsonmodel) {
//                    if let models = [model.result] {
//                        <#code#>
//                    }
                    let modelsub = model.result?.dayList?[0]
                    
                    print("json解析数据：",modelsub as Any)
                }
            } catch {
                print("出错")
                
            }
            
        }
            
    
    }
    
}
