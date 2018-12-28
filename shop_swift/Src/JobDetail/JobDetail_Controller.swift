//
//  JobDetail_Controller.swift
//  shop_swift
//
//  Created by lijun on 2018/3/19.
//  Copyright © 2018年 lijun. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class JobDetail_Controller: BaseViewController, UITableViewDelegate, UITableViewDataSource  {

    var table:UITableView!
    var reuseIdentifiers = ["ASGJobTopCell"]
    var detailInfo = Mapper<Detail_infoEntity>().map(JSONObject: [:])
    var infoId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpUI()
        loadCellData()
    }
    
    func setUpUI() {
        setupNavigation()
        setupTableView()
    }
    
    func setupNavigation() {
        self.navigationItem.title = "岗位详情"
    }
    func setupTableView() {
        let rect = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        table = UITableView(frame:rect)
        table.backgroundColor = UIColor.clear
        table.dataSource = self
        table.delegate = self
        table.estimatedRowHeight = 300
        self.view.addSubview(table)
        //注册cell
        for reuseId in reuseIdentifiers {
            table.register(UINib.init(nibName: reuseId, bundle: Bundle.main), forCellReuseIdentifier: reuseId)
        }
        
        self.LJ_update_dataRefreshByScrollview(scroll: table, target: self, action:#selector(loadData), isBegining: true)
//        self.LJ_more_dataRefreshByScrollview(scroll: table, target: self, action: #selector(loadMoreData))
    }
    
    func loadCellData() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "ASGJobTopCell", for: indexPath) as!ASGJobTopCell
        cell.resetCell(entity: detailInfo!)
        
        return cell
        }
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 85
//    }
    
    //    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 160
    //    }
    
    //MARK：loadData
    //获取数据 @"http://asgapi.99zmall.com/asg/mobile/recruitment/list.json"
    
    @objc func loadData() {
        let url = "http://asgapi.99zmall.com/asg/mobile/recruitment/detail.json"
        let param = ["recId": self.infoId] as [String: Int]
        
        LJBaseService.request(url: url, paramter: param , successBlock: { (result) in
            self.table.mj_header.endRefreshing()
            
            let result = Mapper<DetailDataModel>().map(JSONObject: result)
            if let obj = result {
                self.detailInfo = obj.contents
                self.table.reloadData()
            }
        }) { (failString) in
            //            print(result ?? "error")
        }
    }
    

}
