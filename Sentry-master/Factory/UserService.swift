//
//  UserService.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 11/24/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation

typealias UserService = UserProtocol & UserCreatorProtocol

protocol UserProtocol {
    var firstName: String? { get set }
//    var lastName: String { get }
//    var fullName: String { get }
}

protocol UserCreatorProtocol {
    static func createUser() -> UserProtocol
}


//extension NameProtocol {
//    mutating func createUser(name: String)  {
//
//        guard let newUser = User(entityName: User.type) else {
//            return
//        }
//
//        newUser.name = name
//
//        self.firstName = name
//
//    }
//}
//
//
