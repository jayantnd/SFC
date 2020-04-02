//
//  TestNotifier.swift
//  SFFTests
//
//  Created by Dash, Jayant on 8/22/19.
//  Copyright © 2019 Jayant Dash. All rights reserved.
//

import XCTest

class TestNotifier: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testSubscribe() {
        Notifier.subscribe(notificationNames: ["noti1", "noti2"]) { (notificationName) in
            print(notificationName)
        }
        Notifier.notify(notificationName: "noti1")
        Notifier.unsubscribeAll()
    }
}
