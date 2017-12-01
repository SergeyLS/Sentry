//
//  ActionResult.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 12/1/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation

enum ActionResult <Value> {
    case success(Value)
    case failure(Error)
}
