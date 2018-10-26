//
//  MainViewController.swift
//  shop_swift
//
//  Created by lijun on 2018/3/16.
//  Copyright © 2018年 lijun. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class MainViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    var table:UITableView!
    var dataSourceArray = [Main_infoEntity]()
    var currentpage = 1
    let url = "http://asgapi.99zmall.com/asg/mobile/recruitment/list.json"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        loadCellData()
    }
    
    func setUpUI() {
        setupNavigation()
        setupTableView()
    }
    
    func setupNavigation() {
        self.navigationItem.title = "主页"
    }
    func setupTableView() {
        let rect = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        table = UITableView(frame:rect)
        table.backgroundColor = UIColor.clear
        table.dataSource = self
        table.delegate = self
        self.view.addSubview(table)
        table.register(UINib.init(nibName: "Main_cell", bundle: nil), forCellReuseIdentifier: "main_cell")
    
        self.LJ_update_dataRefreshByScrollview(scroll: table, target: self, action:#selector(loadData), isBegining: true)
        self.LJ_more_dataRefreshByScrollview(scroll: table, target: self, action: #selector(loadMoreData))
    }
    
    func loadCellData() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entity = dataSourceArray[indexPath.row]
        
        let cell = table.dequeueReusableCell(withIdentifier: "main_cell", for: indexPath) as!Main_cell
        cell.resetCell(entity: entity)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = self.dataSourceArray[indexPath.row]
        let detailVC = JobDetail_Controller()
        detailVC.infoId = info.infoId!
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 160
//    }
    
   //MARK：loadData
   //获取数据 @"http://asgapi.99zmall.com/asg/mobile/recruitment/list.json"
    
    @objc func loadData() {
        let param = paramDic(pageIndex: 1) as! [String : Any]
        
        LJBaseService.request(url: url, paramter: param , successBlock: { (result) in
            self.table.mj_header.endRefreshing()

            let result = Mapper<MainDataModel>().map(JSONObject: result)
            if let obj = result {
//                let res = (obj.contents?.rows![0])! as Main_infoEntity
//                print(res.recName!)
                let infoArr = obj.contents?.rows
//                let infoArr = Mapper<Main_infoEntity>().mapArray(JSONArray: (obj.contents?.rows ?? [[String: Any]]()))
                self.currentpage = 1
                self.dataSourceArray = infoArr!
                self.table.reloadData()
//                self.dataSourceArray += infoArr!
            }
        }) { (failString) in
//            print(result ?? "error")
        }
    }
    
    @objc func loadMoreData() {
        var index = currentpage + 1
        if self.dataSourceArray.count == 0 {
            index = 1
        }
        let param = paramDic(pageIndex: index) as! [String : Any]

        LJBaseService.request(url: url, paramter: param, successBlock: { (result) in
            self.table.mj_footer.endRefreshing()
            
            let result = Mapper<MainDataModel>().map(JSONObject: result)
            if let obj = result {
                let infoArr = obj.contents?.rows
                if ((infoArr?.count) ?? 0 > 0) {
                    self.dataSourceArray += infoArr!
                    self.currentpage = index
                    
                    if ((infoArr?.count) ?? 0 < 0) {
                        self.LJ_no_dataRefreshByScrollView(scroll: self.table)
                    }
                    self.table.reloadData()
                }else {
                    self.LJ_no_dataRefreshByScrollView(scroll: self.table)
                }
            }
        }) { (failString) in
            self.table.mj_header.endRefreshing()
        }
    }
    
    func paramDic(pageIndex: NSInteger) -> NSDictionary {
        return ["pageSize": 10, "pageIndex": pageIndex, "recommend": 1, "city" : "上海市", "province" : "上海", "lat" : 31.237855 , "lon" : 121.48522] as NSDictionary
    }
}
