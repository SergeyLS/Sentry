//
//  CoreDataUserService.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 11/27/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation

class CoreDataUserService: UserProtocol  {
    var firstName: String?
    
    init?(name: String) {
        //if CoreData
        let moc = CoreDataManager.shared.viewContext
        
        guard let newUser = User(entityName: User.type, moc: moc) else {
            return nil
        }
        newUser.name = name
        CoreDataManager.shared.save(context: moc)
        
        self.firstName = newUser.name
        
    }
}
