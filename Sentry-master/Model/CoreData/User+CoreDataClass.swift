//
//  User+CoreDataClass.swift
//  
//
//  Created by Sergey Leskov on 11/21/17.
//
//

import Foundation
import CoreData

public class User: NSManagedObject {
    
     static let type = "User"
    
    convenience init? (entityName: String, moc: NSManagedObjectContext = CoreDataManager.shared.viewContext) {
        guard let tempEntity = NSEntityDescription.entity(forEntityName: entityName, in: moc) else {
            fatalError("Could not initialize \(entityName)")
            return nil
        }
        self.init(entity: tempEntity, insertInto: moc)

        //name = "test"
        
    }
}


extension User: UserProtocol {
    var userId: Int {
        get {
            return self.id.intValue
        }
        set {
            self.id = NSNumber(integerLiteral: newValue)
        }
    }
    
    var userName: String {
        get {
            return self.name ?? ""
        }
        set(value) {
            self.name = value
        }
    }
}
