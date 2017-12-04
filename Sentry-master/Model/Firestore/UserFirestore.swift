//
//  UserFirestore.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 12/4/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct UserFirestore {
    
    static let type = "user"
    static let nameKey = "name"
    static let userIdKey = "userId"
    
    public var name: String?
    public var uid: NSNumber
    //public var items: NSSet?
    
    init?(dictionary: [String: Any]) {
        guard
            let name = dictionary[UserFirestore.nameKey] as? String,
            let uid = dictionary[UserFirestore.userIdKey] as? NSNumber
            else {
                return nil
        }
        
        self.name = name
        self.uid = uid
    }
}

extension UserFirestore: UserProtocol {
    var userId: Int {
        get {
            return self.uid.intValue
        }
        set {
            self.uid = NSNumber(integerLiteral: newValue)
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
