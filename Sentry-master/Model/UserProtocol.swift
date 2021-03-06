//
//  UserProtocol.swift
//  Sentry-master
//
//  Created by Oleksandr Lysenkov on 11/28/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation


protocol UserProtocol {
    var userName: String { get set }
    var userId: Int { get set }
}
