//
//  NetWorkEngine.swift
//  shop_swift
//
//  Created by lijun on 2018/3/15.
//  Copyright © 2018年 lijun. All rights reserved.
//

import Foundation
import Alamofire

public let SESSIONID = UserDefaults.standard.dictionary(forKey: "serInfoDic")?["sessionID"]

class LJBaseService {
    typealias SuccessBlock = (Any?) -> ()
    typealias FailBlock = (String) -> ()
    typealias ServiceProgressBlock = (Float) -> ()
    
    static func request(url: String, paramter:[String: Any]?, successBlock: SuccessBlock?, failBlock: FailBlock?) {
        self.request(url: url, method: .post, paramter: paramter, successBlock: successBlock, failBlock: failBlock)
    }
    
    static func request(url: String, method: HTTPMethod, successBlock: SuccessBlock?, failBlock: FailBlock?) {
        self.request(url: url, method: method, paramter: nil, successBlock: successBlock, failBlock: failBlock)
    }
    
    static func request(url: String, method: HTTPMethod, paramter:[String: Any]?, successBlock: SuccessBlock?, failBlock: FailBlock?) {
        let headers = setRequestHeader(params: paramter)
        Alamofire.request(url, method: method, parameters: paramter, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            print(response)
            guard let result = response.result.value else {
                print(response.result.error ?? " --- 网络请求发生了错误 --- ")
                return
            }
            successBlock?(result)

//            if response.result.isSuccess {
//                successBlock?(response.result.value)
////                if let dict = response.result.value as? [String: Any] {
////                    let sta = dict["sta"] as? Int ?? 0
////                    if sta == 1 {
////                        successBlock?(dict["data"])
////                    } else {
////                        failBlock?(dict["msg"] as? String ?? "网络请求失败")
////                        if sta == 5 {
////                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TokenInvalidNotification"), object: nil)
////                        }
////                    }
////                }
//            } else {
//                failBlock?("网络请求失败")
//            }
        }
    }
    
    
    static func setRequestHeader(params:[String: Any]?) -> [String:String] {
        var parameters = [String: String]()
        
        parameters["Content-Type"] = "application/json;charset=utf-8"
//        parameters["iOS"] = "1"
        return parameters
    }
    
    static func appendParameterStr(value: Any?) -> String{
        
        var parameterStr = ""
        
        if((value as? String) != nil){
            //字符串
            parameterStr += value as! String
        } else if((value as? Int) != nil){
            //Int
            parameterStr += String(format: "%d", value as! Int)
        } else if((value as? Bool) != nil){
            //Bool
            let v = value as! Bool
            if (v == true){
                parameterStr += "true"
            } else {
                parameterStr += "false"
            }
            
        } else if((value as? Float) != nil){
            //Float
            parameterStr += String(format: "%f", value as! Float)
            
        } else if((value as? Double) != nil){
            //Double
            
            let num = NSNumber.init(value: value as! Double)
            parameterStr += String(format: "%@", num)
            
        } else if((value as? Date) != nil){
            //Date
            
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
            parameterStr += dateFormat.string(from: value as! Date)
            
        } else if((value as? [String:Any]) != nil){
            // 字典
            let dic = value as! [String:Any]
            //字典不为空
            if dic.isEmpty == false {
                parameterStr += "{"
                
                for(key , v) in dic{
                    parameterStr += key
                    parameterStr += "="
                    parameterStr += appendParameterStr(value: v)
                    parameterStr += ", "
                }
                let length = parameterStr.characters.count
                let index = parameterStr.index(parameterStr.startIndex, offsetBy: length - 2)
                parameterStr = parameterStr.substring(to: index)
                
                parameterStr += "}"
            }
            
        } else if ((value as? [Any]) != nil){
            // 数组
            let array = value as! [Any]
            
            if array.isEmpty == false{
                parameterStr += "["
                
                for i in 0 ..< array.count{
                    let ele = array[i]
                    let str = appendParameterStr(value: ele)
                    parameterStr += str
                    if (i != (array.count - 1)){
                        parameterStr += ", "
                    }
                }
                parameterStr += "]"
                
            }
        }
        
        return parameterStr
        
    }
    // 生成13位时间戳
    static func createTimeStamp() -> String{
        let date = Date.init(timeIntervalSinceNow: 0)
        let timeInterval = date.timeIntervalSince1970*1000
        let timeStamp = String(format: "%0.0f",timeInterval)
        return timeStamp
    }
}
