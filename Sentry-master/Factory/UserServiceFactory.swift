//
//  UserServiceFactory.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 11/24/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//


class UserServiceFactory {
    
    //==================================================
    // MARK: - Singleton
    //==================================================
    static let shared = UserServiceFactory()
    private init() { }

    
    //==================================================
    // MARK: - Method(s)
    //==================================================
    func createUserService(kindService: KindService) -> UserService {
        
        switch kindService {
        case .coreData:
            return CoreDataUserService()
        case .firestore:
            return FirestoreUserService()
        }
    }
    
}
