//
//  FirestoreUserService.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 12/4/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation
import CoreData
import FirebaseFirestore

class FirestoreUserService: UserService  {
    
    
    init() { }

    static let firestore = Firestore.firestore()
    static let dbUser = firestore.collection(UserFirestore.type)
    
    func createUser(withName name: String, withId id: Int, completion: @escaping (Error?, UserProtocol?) -> Void) {
        
        let document = FirestoreUserService.dbUser.document()
        
        var values = [String: Any]()
        values["id"] = document.documentID
        values[UserFirestore.nameKey] = name
        values[UserFirestore.userIdKey] = id
        
        document.setData(values) { (error) in
            if error == nil {
                let userFirestore = UserFirestore(dictionary: values)
                completion(nil, userFirestore)
                return
            }
           
            completion(error, nil)
        }
    }

    
    func deleteLastUser() -> ActionResult<Any> {
        return ActionResult.failure(ErrorsCoreData.errorArray)
    }
    
    func findUser(withId: Int) -> UserProtocol? {
        return nil
    }
    
    func countUser() -> Int {
        return 0
    }
    
    
}
