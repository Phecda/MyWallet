//
//  ListItemViewCell.swift
//  MyWallet
//
//  Created by 宿志鹏 on 2017/3/23.
//  Copyright © 2017年 Jerry Su. All rights reserved.
//

import UIKit

class ListItemViewCell: UITableViewCell {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var propertyNameLabel: UILabel!
}

//extension ListItemViewCell {
//    func configureCell(ForItem item: AccountItem) {
//        self.propertyNameLabel.text = item.ofProperty!.name
//        self.commentLabel.text = item.comments
//        self.priceLabel.text = item.price?.currencyOutput()
//        self.priceLabel.textColor = item.isSpend ? UIColor.red : UIColor.green
//    }
//}

extension NSDecimalNumber {
    func currencyOutput() -> String {
        return String(format: "%.2f", self.decimalValue as CVarArg)
    }
}
