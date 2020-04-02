//
//  Error+SFF.swift
//  SFF
//
//  Created by Dash, Jayant on 3/31/20.
//  Copyright © 2020 Jayant Dash. All rights reserved.
//

import Foundation

extension Error {
    
    var code: Int {
        return (self as NSError).code
    }
    
    var domain: String {
        return (self as NSError).domain
    }
}
