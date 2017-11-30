//
//  PrintManager.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 11/30/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation

enum myPrintKind {
    case warning
    case error
    case normal
}

func myPrint(text: String, kind: myPrintKind = .normal) {
    print(text)
}
