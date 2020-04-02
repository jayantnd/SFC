//
//  Notifier.swift
//  SFF
//
//  Created by Dash, Jayant on 8/21/19.
//  Copyright © 2019 Jayant Dash. All rights reserved.
//

import Foundation
import UIKit

class Notifier {
    
    private static var container: [String: [String: ((String) -> Void)]] = [:]
    
    private init() {}
    
    static func subscribe(subscriberName: String = #file, class: String = #function, notificationNames: [String], callback: @escaping ((String) -> Void)) {
        
        notificationNames.forEach { (notificationName) in
            if var value = container[notificationName] {
                value[subscriberName] = callback
            } else {
                container[notificationName] = [subscriberName: callback]
            }
        }
    }
    
    static func unsubscribe(subscriberName: String = #file, notificationNames: [String]? = nil) {
        
        notificationNames?.forEach({ (notificationName) in
            container[notificationName]?.removeValue(forKey: subscriberName)
        })
    }
    
    static func unsubscribeAll() {
        container.removeAll()
    }
    
    static func notify(notificationName: String) {
        if let value = container[notificationName] {
            for (_, value) in value {
                value(notificationName)
            }
        }
    }
}
