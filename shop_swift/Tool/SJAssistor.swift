//
//  SJAssistor.swift
//  shop_swift
//
//  Created by lijun on 2018/10/30.
//  Copyright © 2018 lijun. All rights reserved.
//

import UIKit

class SJAssistor: NSObject {
    
    static func filterHTML(html: String) -> String {
        
        let scanner = Scanner(string: html)
        var text: NSString? = nil
        
        while scanner.isAtEnd == false {
            scanner.scanUpTo("<", into: nil)
            scanner.scanUpTo(">", into: &text)
html = [html .replacingOccurrences(of: String.init(format: <#T##String#>, <#T##arguments: CVarArg...##CVarArg#>), with: <#T##StringProtocol#>)]
        }
        
        
    }

}
