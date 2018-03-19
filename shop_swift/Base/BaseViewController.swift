//
//  BaseViewController.swift
//  shop_swift
//
//  Created by lijun on 2018/3/15.
//  Copyright © 2018年 lijun. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.
    }
    
    func LJ_update_dataRefreshByScrollview(scroll: UIScrollView, target: Any, action: Selector, isBegining: Bool) -> () {
        //设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
        let header = MJRefreshNormalHeader()
        header.setRefreshingTarget(self, refreshingAction: action)

        //设置自动切换透明度(在导航栏下面自动隐藏)
        header.isAutomaticallyChangeAlpha = true
        //隐藏时间
        header.lastUpdatedTimeLabel.isHidden = true
        header.setTitle("下拉刷新", for: .idle)
        header.setTitle("释放立即刷新", for: .pulling)
        header.setTitle("正在刷新", for: .refreshing)

        //马上进入刷新状态
        if(isBegining){
            header.beginRefreshing()
        }
        
        // 设置header
        scroll.mj_header = header;
//        scroll.mj_header.isAutomaticallyChangeAlpha = true;
    }
    
    func LJ_more_dataRefreshByScrollview(scroll: UIScrollView, target: Any, action: Selector) -> () {
        //设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
        let footer = MJRefreshAutoNormalFooter()
        footer.setRefreshingTarget(self, refreshingAction: action)
        
        //设置自动切换透明度(在导航栏下面自动隐藏)
        footer.isRefreshingTitleHidden = true
        //隐藏时间
//        footer.setTitle("下拉刷新", for: .idle)
//        footer.setTitle("释放立即刷新", for: .pulling)
//        footer.setTitle("正在刷新", for: .refreshing)
      
        // 设置header
        scroll.mj_footer = footer;
        scroll.mj_footer.isAutomaticallyChangeAlpha = true;
    }
    
    func LJ_resetRefreshByScrollView(scroll: UIScrollView) -> () {
        
        let footer = MJRefreshAutoNormalFooter()
        footer.resetNoMoreData()
    }
    
    func LJ_no_dataRefreshByScrollView(scroll: UIScrollView) -> () {
        //设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
        let footer = MJRefreshAutoNormalFooter()
        footer.endRefreshingWithNoMoreData()
    }

}
