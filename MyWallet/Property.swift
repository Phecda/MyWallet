//
//  Property.swift
//  MyWallet
//
//  Created by 宿志鹏 on 2017/4/26.
//  Copyright © 2017年 Jerry Su. All rights reserved.
//

import Foundation
import RealmSwift

class Property: Object {
    
    // MARK: - properties
    dynamic var balance = 0.0
    dynamic var name: String = ""
    dynamic var comment: String = ""
    
    // MARK: - relationship
    let accountItems = List<AccountItem>()
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
