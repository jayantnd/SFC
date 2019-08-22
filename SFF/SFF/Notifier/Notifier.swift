//
//  Notifier.swift
//  SFF
//
//  Created by Dash, Jayant on 8/21/19.
//  Copyright © 2019 Jayant Dash. All rights reserved.
//

import Foundation

class Notifier {
    
    private static var container: [String: NSMapTable<AnyObject, AnyObject>] = [:]
    
    private init() {}
    
    static func subscribe(subscriberName: String = #file, notificationNames: [String], callback: @escaping ((String) -> Void)) {
        
        notificationNames.forEach { (name) in
            if let value = container[name] {
                value.setObject(callback as AnyObject, forKey: subscriberName as AnyObject)
            } else {
                let mapTable = NSMapTable<AnyObject, AnyObject>(keyOptions: .strongMemory, valueOptions: .weakMemory)
                mapTable.setObject(callback as AnyObject, forKey: subscriberName as AnyObject)
                container[name] = mapTable
            }
        }
    }
    
    static func unsubscribe(subscriberName: String = #file, notificationNames: [String]? = nil) {
        guard let notificationNames = notificationNames else {
            container.forEach { (key, value) in
                value.removeObject(forKey: subscriberName as AnyObject)
            }
            return
        }
        
        notificationNames.forEach { (name) in
            if let value = container[name] {
                value.removeObject(forKey: subscriberName as AnyObject)
            }
        }
    }
    
    static func unsubscribeAll() {
        container.removeAll()
    }
    
    static func notify(notificationName: String) {
        if let value = container[notificationName] {
            value.objectEnumerator()?.forEach({ (callback) in
                if let callback = callback as? ((String) -> Void) {
                    callback(notificationName)
                }
            })
        }
    }
}
