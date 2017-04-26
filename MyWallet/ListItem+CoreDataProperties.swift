//
//  ListItem+CoreDataProperties.swift
//  MyWallet
//
//  Created by 宿志鹏 on 2017/4/19.
//  Copyright © 2017年 Jerry Su. All rights reserved.
//

import Foundation
import CoreData


extension ListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListItem> {
        return NSFetchRequest<ListItem>(entityName: "ListItem")
    }

    @NSManaged public var comments: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var isSpend: Bool
    @NSManaged public var price: NSDecimalNumber?
    @NSManaged public var ofProperty: Property?

}
