//
//  BaseNavigationController.swift
//  shop_swift
//
//  Created by lijun on 2018/3/15.
//  Copyright © 2018年 lijun. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //状态栏高亮
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        let navBar = UINavigationBar.appearance()
        navBar.isTranslucent = false
        navBar.tintColor = UIColor.white
        navBar.barTintColor = UIColor.black
        navBar.backIndicatorImage = UIImage.init(named: "p_backArrow")
        navBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17),NSAttributedStringKey.foregroundColor: UIColor.white]
        navBar.backIndicatorImage = UIImage.init(named: "p_backArrow")
        //导航渐变色
//        let gradientLayer = CAGradientLayer.init()
//        gradientLayer.colors = [UIColor.red.withAlphaComponent(1).cgColor,UIColor.red.withAlphaComponent(0.3).cgColor]
//
//
//        gradientLayer.locations = [0.3, 1.0]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
//        gradientLayer.frame = CGRect(x:0, y:-20, width:SCREEN_WIDTH, height:64)
//        self.navigationBar.layer.addSublayer(gradientLayer)
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        super .pushViewController(viewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
