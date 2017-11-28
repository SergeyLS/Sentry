//
//  UserService.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 11/24/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation

protocol UserService {
    func createUser(withName name: String) -> UserProtocol?
    func deleteUser(withName name: String)
}
