//
//  ASGJobTopCell.swift
//  shop_swift
//
//  Created by lijun on 2018/10/25.
//  Copyright © 2018 lijun. All rights reserved.
//

import UIKit

class ASGJobTopCell: UITableViewCell {

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
        
        //        headerImageView.sd_setImage(with: URL(string: cellEntity.img!), completed: nil)
        //        titlelabel.text = "\(cellEntity.recName ?? "")"
        //        loactionLabel.text = "\(cellEntity.city ?? "") / \(cellEntity.distance ?? "")"
        //        payMentLabel.text = "\(cellEntity.payment ?? "")"
        //        timeLabel.text = "\(cellEntity.releaseTime ?? "")"
    }
    
}
