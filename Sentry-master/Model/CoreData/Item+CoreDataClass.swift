//
//  Item+CoreDataClass.swift
//  
//
//  Created by Sergey Leskov on 11/21/17.
//
//

import Foundation
import CoreData


public class Item: NSManagedObject {

    
    static let type = "Item"
    
    convenience init? (moc: NSManagedObjectContext) {
        guard let tempEntity = NSEntityDescription.entity(forEntityName: Item.type, in: moc) else {
            fatalError("Could not initialize \(Item.type)")
            return nil
        }
        self.init(entity: tempEntity, insertInto: moc)
        
        //name = "test"
        
    }

}
