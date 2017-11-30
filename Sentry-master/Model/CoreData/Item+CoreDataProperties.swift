//
//  Item+CoreDataProperties.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 11/28/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int
    @NSManaged public var user: User?

}
