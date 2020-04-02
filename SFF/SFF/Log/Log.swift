//
//  Log.swift
//  SFF
//
//  Created by Dash, Jayant on 3/28/20.
//  Copyright © 2020 Jayant Dash. All rights reserved.
//

import Foundation

/// Types of the log so we can distinguish the error types in console
public enum LogType: Int {
    
    /// Log type success.
    case success = 0
    
    /// Log type warning.
    case warning
    
    /// Log type error.
    case error
    
    /// Log type debug.
    case debug
    
    /// Log type info.
    case info
}

class Log {
    
    private init() {}
    
    private static let format = "Thread = %@, \nTime = %@, \nFile Name = %@, \nLine number = %d, \nFunction Name = %@, \nMessage = %@"

    public static var showLogs: Set<LogType> = [.success, .warning,. error, .debug, .info]
    
    // later create a xcode extension to support choosing the show logtype
    
    /// print
    static func p(_ message: Any?,
                  logType: LogType,
                  filePath: String = #file,
                  lineNumber: Int = #line,
                  functionName: String = #function) {
    
        if !showLogs.contains(logType) {
            return
        }
        
        switch logType {
            case .success :
                Log.s(message, filePath: filePath, lineNumber: lineNumber, functionName: functionName)
             case .warning:
                 Log.w(message, filePath: filePath, lineNumber: lineNumber, functionName: functionName)
             case .error:
                 Log.e(message, filePath: filePath, lineNumber: lineNumber, functionName: functionName)
             case .debug:
                 Log.d(message, filePath: filePath, lineNumber: lineNumber, functionName: functionName)
             case .info:
                 Log.i(message, filePath: filePath, lineNumber: lineNumber, functionName: functionName)
        }
    }
    /// debug
    static func s(_ message: Any?,
                  filePath: String = #file,
                  lineNumber: Int = #line,
                  functionName: String = #function) {
        if !showLogs.contains(.success) {
            return
        }

    }
    
    /// info
    static func w(_ message: Any?,
                    filePath: String = #file,
                    lineNumber: Int = #line,
                    functionName: String = #function) {
        if !showLogs.contains(.warning) {
            return
        }
    }
    
    /// Error
    static func e(_ message: Any?,
                    filePath: String = #file,
                    lineNumber: Int = #line,
                    functionName: String = #function) {
        if !showLogs.contains(.error) {
            return
        }
    }
    
    /// success
    static func d(_ message: Any?,
                    filePath: String = #file,
                    lineNumber: Int = #line,
                    functionName: String = #function) {
        if !showLogs.contains(.debug) {
            return
        }
    }
    
    /// warning
    static func i(_ message: Any?,
                    filePath: String = #file,
                    lineNumber: Int = #line,
                    functionName: String = #function) {
        if !showLogs.contains(.info) {
            return
        }
    }
}
