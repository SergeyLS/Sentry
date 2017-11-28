//
//  CoreDataUserService.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 11/27/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation

class CoreDataUserService: UserService  {
    private let context = CoreDataManager.shared.viewContext
    
    init() { }
    
    func createUser(withName name: String) -> UserProtocol? {
        guard let newUser = User(entityName: User.type, moc: self.context) else { return nil }
        
        newUser.name = name
        CoreDataManager.shared.save(context: self.context)
        
        return newUser
    }
}
