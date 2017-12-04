//
//  PrintManager.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 11/30/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation


func myPrint(_ text: String, call: Any? = nil, kind: MyPrintKind = .message) {
    
    // MARK: Думаю назвать лучше caller, type вместо call и kind
    // MARK: Чтобы не передавать call или caller все время, возможно лучше воспользоваться: "\(#file.lastPathComponent):\(#line) : \(#function)"
    
    var result = ""

    if let call = call {
        result += "[\(type(of: call))] "
    }

    result += text
    
    switch kind {
    case .warning, .error:
        NSLog(result)
    case .message:
        print(result)
    }
}
