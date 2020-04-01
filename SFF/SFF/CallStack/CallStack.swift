//
//  CallStack.swift
//  SFF
//
//  Created by Dash, Jayant on 9/2/19.
//  Copyright © 2019 Jayant Dash. All rights reserved.
//

import Foundation

class CallStack {
    
    static func stack() {
        let _ = Thread.callStackSymbols
    }
    
    static func calledClass() -> String {
        return ""
    }
}
