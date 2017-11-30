//
//  CoreDataUserService.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 11/27/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation
import CoreData

class CoreDataUserService: UserService  {
    
    
    private let context = CoreDataManager.shared.viewContext
    init() { }
    
    func countUser() -> Int {
        let request = NSFetchRequest<User>(entityName: User.type)
        
        //        var arrayPredicate:[NSPredicate] = []
        //        arrayPredicate.append(NSPredicate(format: "user == %@", currentUser))
        //        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: arrayPredicate)
        //        request.predicate = predicate
        
        guard let resultsArray = try? self.context.fetch(request) else {
            return 0
        }
        
        return resultsArray.count
    }
    
    func createUser(withName name: String, withId id: Int) -> UserProtocol? {
        guard let newUser = User(entityName: User.type, moc: self.context) else { return nil }
        newUser.name = name
        newUser.id = id
        CoreDataManager.shared.save(context: self.context)
        
        return newUser
        
    }
    
    func findUser(withId id: Int) -> UserProtocol? {
        
        return nil
    }
    
    func deleteLastUser() -> Bool {
        let request = NSFetchRequest<User>(entityName: User.type)
        guard let resultsArray = try? self.context.fetch(request) else {
            return false
        }
        
        guard let lastRecord = resultsArray.last else {
            return false
        }
        
        self.context.delete(lastRecord)
        CoreDataManager.shared.save(context: self.context)
        
        return true
    }
    
}
