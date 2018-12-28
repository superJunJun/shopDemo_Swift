//
//  ASGJobTopCell.swift
//  shop_swift
//
//  Created by lijun on 2018/10/25.
//  Copyright © 2018 lijun. All rights reserved.
//

import UIKit

class ASGJobTopCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var payAmount: UILabel!
    @IBOutlet weak var applyCount: UILabel!
    @IBOutlet weak var updateTime: UILabel!
    @IBOutlet weak var dixin: UILabel!
    @IBOutlet weak var zhiwei: UILabel!
    @IBOutlet weak var renshu: UILabel!
    @IBOutlet weak var yaoqiu: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var miaoshu: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var companyImg: UIImageView!
    @IBOutlet weak var companyDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func resetCell(entity: Detail_infoEntity) {
//        let cellEntity = entity
        title.text = "\(entity.recName  ?? "")"
        payAmount.text = "\(entity.payment  ?? "")"
        applyCount.text = "\(entity.applyCount  ?? 0)"
        updateTime.text = "\(entity.releaseTime  ?? ""))"
        dixin.text = "\(entity.basicPay  ?? "")"
        zhiwei.text = "\(entity.workExp  ?? "")"
        renshu.text = "\(entity.recruitNum  ?? 0)"
        yaoqiu.text = "\(entity.requirement  ?? "")"
        location.text = "\(entity.position  ?? "")"
        miaoshu.text = "\(entity.jobDescription  ?? "")"
        company.text = "\(entity.merName  ?? "")"
        companyDetail.text = "\(entity.merchant  ?? "")"

        companyImg.kf.setImage(with: URL(string: (entity.merLogoImgUrl ?? "")), placeholder: nil)
    }
    
}
