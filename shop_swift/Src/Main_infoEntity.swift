//
//  Main_infoEntity.swift
//  shop_swift
//
//  Created by lijun on 2018/3/16.
//  Copyright © 2018年 lijun. All rights reserved.
//

import UIKit
import ObjectMapper

class Main_infoEntity: Mappable {
    
    var createTime: String?
    var releaseTime: String?
    var recName: String?
    var payAbove: String?
    var payBelow: String?
    var infoId: NSInteger?
    var payUnit: String?
    var startDate: String?
    var endDate: String?
    var city: String?
    var img: String?
    var logo: String?
    var distance: String?
    var payment: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        createTime <- map["createTime"]
        releaseTime <- map["releaseTime"]
        recName <- map["recName"]
        payAbove <- map["payAbove"]
        payBelow <- map["payBelow"]
        infoId <- map["id"]
        payUnit <- map["payUnit"]
        startDate <- map["startDate"]
        endDate <- map["endDate"]
        city <- map["city"]
        img <- map["img"]
        logo <- map["logo"]
        distance <- map["distance"]
        payment <- map["payment"]
    }
}

class dataObj: Mappable {
    var pageIndex:NSNumber?
    var pageSize:NSNumber?
    var rows:[Main_infoEntity]?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        pageIndex <- map["pageIndex"]
        pageSize <- map["pageSize"]
        rows <- map["rows"]
    }
}

class MainDataModel: Mappable {
    var status:Int?
    var msg:String?
    var contents:dataObj?
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        contents <- map["contents"]
    }
}
