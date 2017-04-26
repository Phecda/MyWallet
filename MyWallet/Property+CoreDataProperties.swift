//
//  Property+CoreDataProperties.swift
//  MyWallet
//
//  Created by 宿志鹏 on 2017/4/19.
//  Copyright © 2017年 Jerry Su. All rights reserved.
//

import Foundation
import CoreData


extension Property {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Property> {
        return NSFetchRequest<Property>(entityName: "Property")
    }

    @NSManaged public var amount: NSDecimalNumber?
    @NSManaged public var comments: String?
    @NSManaged public var name: String?
    @NSManaged public var items: NSOrderedSet?

}

// MARK: Generated accessors for items
extension Property {

    @objc(insertObject:inItemsAtIndex:)
    @NSManaged public func insertIntoItems(_ value: ListItem, at idx: Int)

    @objc(removeObjectFromItemsAtIndex:)
    @NSManaged public func removeFromItems(at idx: Int)

    @objc(insertItems:atIndexes:)
    @NSManaged public func insertIntoItems(_ values: [ListItem], at indexes: NSIndexSet)

    @objc(removeItemsAtIndexes:)
    @NSManaged public func removeFromItems(at indexes: NSIndexSet)

    @objc(replaceObjectInItemsAtIndex:withObject:)
    @NSManaged public func replaceItems(at idx: Int, with value: ListItem)

    @objc(replaceItemsAtIndexes:withItems:)
    @NSManaged public func replaceItems(at indexes: NSIndexSet, with values: [ListItem])

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: ListItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: ListItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSOrderedSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSOrderedSet)

}
