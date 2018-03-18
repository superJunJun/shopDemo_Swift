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

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var table:UITableView!
    var dataSourceArray = [Main_infoEntity]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        loadCellData()
        loadData()
    }
    
    func setUpUI() {
        setupNavigation()
        setupTableView()
    }
    
    func setupNavigation() {
        
    }
    func setupTableView() {
        let rect = self.view.frame
        table = UITableView(frame:rect)
        table.backgroundColor = UIColor.clear
        table.sectionFooterHeight = 0
        table.sectionHeaderHeight = 0
        table.dataSource = self
        table.delegate = self
        self.view.addSubview(table)
        table.register(UINib.init(nibName: "Main_cell", bundle: nil), forCellReuseIdentifier: "main_cell")
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
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 160
//    }
    
   //MARK：loadData
   //获取数据 @"http://asgapi.99zmall.com/asg/mobile/recruitment/list.json"
    
    func loadData() {
        let url = "http://asgapi.99zmall.com/asg/mobile/recruitment/list.json"
        LJBaseService.request(url: url, method: .get, successBlock: { (result) in
            let result = Mapper<MainDataModel>().map(JSONObject: result)
            if let obj = result {
//                let res = (obj.contents?.rows![0])! as Main_infoEntity
//                print(res.recName!)
                let infoArr = obj.contents?.rows
//                let infoArr = Mapper<Main_infoEntity>().mapArray(JSONArray: (obj.contents?.rows ?? [[String: Any]]()))
                
                self.dataSourceArray = infoArr!
                self.table.reloadData()
//                self.dataSourceArray += infoArr!
            }
        }) { (failString) in
//            print(result ?? "error")
        }
    }
}
