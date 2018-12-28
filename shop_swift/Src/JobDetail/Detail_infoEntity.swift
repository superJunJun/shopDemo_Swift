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
    var jobDescription: String?
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
    var merName: String?
    var merchant: String?


    required init?(map: Map) {
    }

    func mapping(map: Map) {
        startTime <- map["startTime"]
        endTime <- map["endTime"]
        startDateFormat <- map["startDateFormat"]
        endDateFormat <- map["endDateFormat"]
        jobId <- map["jobId"]
        createTime <- map["createTime"]
        recName <- map["recName"]
        position <- map["position"]
        eduValue <- map["eduValue"]
        workExp <- map["workExp"]
        payment <- map["payment"]
        basicPay <- map["basicPay"]
        settleAccount <- map["settleAccount"]
        releaseTime <- map["releaseTime"]
        status <- map["status"]
        requirement <- map["requirement"]
        merLogoImgUrl <- map["merLogoImgUrl"]
        statusValue <- map["statusValue"]
        recruitNum <- map["recruitNum"]
        applyCount <- map["applyCount"]
        fullPartMark <- map["fullPartMark"]
        welfare <- map["welfare"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        applyCompleteC <- map["applyCompleteC"]
        collectCount <- map["collectCount"]
        workStartDate <- map["workStartDate"]
        workEndDate <- map["workEndDate"]
        workStartTime <- map["workStartTime"]
        workEndTime <- map["workStartTime"]
        jobDescription <- map["jobDescription"]
        merName <- map["merName"]
        merchant <- map["merchant"]
    }
}

class DetailDataModel: Mappable {
    var status:Int?
    var msg:String?
    var contents:Detail_infoEntity?
    init(){}
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        contents <- map["contents"]
    }
}

