//
//  Main_cell.swift
//  shop_swift
//
//  Created by lijun on 2018/3/16.
//  Copyright © 2018年 lijun. All rights reserved.
//

import UIKit
import SDWebImage

class Main_cell: UITableViewCell {

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var loactionLabel: UILabel!
    @IBOutlet weak var payMentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.selectionStyle = UITableViewCellSelectionStyle
        .none
    }
    func resetCell(entity: Main_infoEntity) {
        let cellEntity = entity
        
        headerImageView.sd_setImage(with: URL(string: cellEntity.img!), completed: nil)
        titlelabel.text = "\(cellEntity.recName ?? "")"
        loactionLabel.text = "\(cellEntity.city ?? "") / \(cellEntity.distance ?? "")"
        payMentLabel.text = "\(cellEntity.payment ?? "")"
        timeLabel.text = "\(cellEntity.releaseTime ?? "")"
    }
    
}


