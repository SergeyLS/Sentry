//
//  ItemProtocol.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 11/28/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation

protocol ItemProtocol {
    var name: String { get set }
    var id: Int { get set }
    
    var user: UserProtocol { get set }
}
