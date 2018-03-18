//
//  CommonMacro.swift
//  shop_swift
//
//  Created by lijun on 2018/3/15.
//  Copyright © 2018年 lijun. All rights reserved.
//

import Foundation
import UIKit

//MARK:------------------------------------
//
public let DeviceSystemVersion:String = UIDevice.current.systemVersion
public let IsDeviceVersioniOS6:Bool = Double(DeviceSystemVersion) ?? 0.0 > 7.0

// 尺寸
public let SCREEN_WIDTH = UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

//MARK:-------------------------------------------------------------------------

// 主题色

public let TITLE_TEXTCOLOR = UIColor.init(red: 36/255.0, green: 38/255.0, blue: 40/255.0, alpha: 1.0)

public let DESC_TEXTCOLOR = UIColor.init(red: 138/255.0, green: 142/255.0, blue: 150/255.0, alpha: 1.0)

public let NAV_BAR_COLOR_1 = UIColor(red: 60/255.0, green: 68/255.0, blue: 94/255.0, alpha: 1.0)

public let NAV_BAR_COLOR_2 = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)

