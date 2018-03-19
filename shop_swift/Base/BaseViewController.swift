//
//  BaseViewController.swift
//  shop_swift
//
//  Created by lijun on 2018/3/15.
//  Copyright © 2018年 lijun. All rights reserved.
//

import UIKit
import MJRefresh

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(hex: 0xf8f8f8)
        
        
        // Do any additional setup after loading the view.
    }
    
    func LJ_update_dataRefreshByScrollview(scroll: UIScrollView, target: Any, action: Selector, isBegining: Bool) -> () {
        //设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
        let header = MJRefreshHeader()
        header.setRefreshingTarget(self, refreshingAction: action)

        //设置自动切换透明度(在导航栏下面自动隐藏)
        header.isAutomaticallyChangeAlpha = true;
        //隐藏时间
        header.setTitle("你拉我干什么，你个臭流氓。。。", for: .pulling)
        header.setTitle("走开走开啦", for: .refreshing)

        //马上进入刷新状态
        if(isBegining){
            header.beginRefreshing()
        }
        
        // 设置header
        scroll.mj_header = header;
        scroll.mj_header.isAutomaticallyChangeAlpha = true;
    }

}
