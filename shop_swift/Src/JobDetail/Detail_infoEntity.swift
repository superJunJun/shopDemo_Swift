//
//  Detail_infoEntity.swift
//  shop_swift
//
//  Created by lijun on 2018/3/19.
//  Copyright © 2018年 lijun. All rights reserved.
//

import UIKit
import ObjectMapper

class Detail_infoEntity:  Mappable {

    var startTime: String?
    var endTime: String?
    var startDateFormat: String?
    var endDateFormat: String?
    var jobId: NSInteger?
    var createTime: String?
    var recName: String?
    var position: String?
    var eduValue: String?
    var workExp: String?
    var payment: String?
    var basicPay: String?
    var settleAccount: String?
    var releaseTime: String?

    var status: String?
    var requirement: String?
    var merLogoImgUrl: String?
    var statusValue: String?
    var recruitNum: NSInteger?
    var applyCount: NSInteger?
    var fullPartMark: NSInteger?
    var welfare: String?

    var latitude: Double?
    var longitude: Double?
    var applyCompleteC: NSInteger?
    var collectCount: NSInteger?
    var workStartDate: String?
    var workEndDate: String?
    var workStartTime: String?
    var workEndTime: String?

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        createTime <- map["createTime"]
        releaseTime <- map["releaseTime"]
        recName <- map["recName"]
//        payAbove <- map["payAbove"]
//        payBelow <- map["payBelow"]
//        infoId <- map["infoId"]
//        payUnit <- map["payUnit"]
//        startDate <- map["startDate"]
//        endDate <- map["endDate"]
//        city <- map["city"]
//        img <- map["img"]
//        logo <- map["logo"]
//        distance <- map["distance"]
        payment <- map["payment"]
    }
}

class detaildataObj: Mappable {
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

class DetailDataModel: Mappable {
    var status:Int?
    var msg:String?
    var contents:detaildataObj?
    init(){}
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        contents <- map["contents"]
    }
}

