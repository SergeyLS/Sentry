//
//  Constants.swift
//  Sentry-master
//
//  Created by Oleksandr Lysenkov on 11/22/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation


// MARK: В таком и подобных решениях удобнее всего хранить набор со шрифтами, цветами, размерами и прочими константами по проекту, которые в итоге может понадобится поменять + все эти вещи не должны попать в тела методов, так как сразу теряется гибкость.
struct Constants {
    
    struct Storage {
        static let persistentModelName = "Model"
    }
    
    struct Sentry {
        static let dsn = "https://2854f633d27849da99c64621ed7be889:5827d41f6d694a668975f658d5d655dc@sentry.io/248484"
    }
}
