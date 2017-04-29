//
//  AccountItem.swift
//  MyWallet
//
//  Created by 宿志鹏 on 2017/4/26.
//  Copyright © 2017年 Jerry Su. All rights reserved.
//

import Foundation
import RealmSwift

class AccountItem: Object {
    
    // MARK: - properties
    dynamic var date: Date = Date()
    dynamic var price: Double = 0.0
    dynamic var tag: String = ""
    dynamic var isSpend: Bool = true
    
    // MARK: - relationship
    let ofProperty = LinkingObjects(fromType: Property.self, property: "accountItems")
    
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
