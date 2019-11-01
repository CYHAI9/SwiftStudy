//
//  JsonModel.swift
//  SwiftStudy
//
//  Created by ChenYinHai on 2019/11/1.
//  Copyright © 2019 陈海哥. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

class JsonModel: NSObject {
    
    var statusCode: String?
    var result: NSArray?
    var desc: String?
    init(jsonData: JSON) {
        statusCode = jsonData["statusCode"].stringValue
        result = jsonData["result"].arrayValue as NSArray
        desc = jsonData["result"].stringValue
    }
}

class JsonModelHandy: HandyJSON {
    var statusCode: String?
    var result: JsonModelSub?
    var desc: String?
    required init() {}
}
class JsonModelSub: HandyJSON {
    var area: String?
    var areaid: String?
    var dayList: [jsonModelSubSub]?
    required init() {}
}

class jsonModelSubSub: HandyJSON {
    var area: String?
    var areaid: String?
    var day_air_temperature: String?
    var day_weather_code: String?
    var day_weather_pic: String?
    var testText: String?
    required init() {}
}
