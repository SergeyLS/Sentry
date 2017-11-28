//
//  UserService.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 11/24/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation

protocol UserService {
    func createUser(withName name: String, withId: Int64) -> UserProtocol?
    func deleteLastUser() -> Bool
    func findUser(withId: Int64) -> UserProtocol?
    func countUser() -> Int
}
