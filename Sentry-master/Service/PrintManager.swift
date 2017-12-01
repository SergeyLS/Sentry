//
//  PrintManager.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 11/30/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation


func myPrint(_ text: String, call: Any? = nil, kind: MyPrintKind = .normal) {
    
   // CallStackAnalyser.classAndMethodForStackSymbol(Thread.callStackSymbols()[2])
//       for symbol in Thread.callStackSymbols {
//            print(symbol)
//        }
    
    var rezult = ""
    
    if let call = call {
        let callType = type(of: call)
        rezult += "[\(callType)] "
    }
    
    rezult += text
    
    if kind == .error || kind == .warning {
        NSLog(rezult)
    } else {
        print(rezult)
    }
}
