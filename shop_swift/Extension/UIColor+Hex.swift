//
//  UIColor+Hex.swift
//  shop_swift
//
//  Created by lijun on 2018/3/15.
//  Copyright © 2018年 lijun. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    convenience init(hex:CLong) {
        let red   = Double(((hex & 0xFF0000) >> 16))/255.0
        let green = Double(((hex & 0xFF00) >> 8))/255.0
        let blue  = Double(((hex & 0xFF)))/255.0

        self.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
}
