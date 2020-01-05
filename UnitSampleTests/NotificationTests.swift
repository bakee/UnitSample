//
//  NotificationTests.swift
//  UnitSampleTests
//
//  Created by New User on 11/12/19.
//  Copyright © 2019 New User. All rights reserved.
//

import XCTest
@testable import UnitSample

class NotificationTests: XCTestCase {
    
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNotification() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let notificationCenter = NotificationCenter()
        let notificationObserver = NotificationObserver(notification:notificationCenter)

        XCTAssertFalse(notificationObserver.didHandleNotification)
        
        let notificationObservable = NotificationObservable(notificationCenter: notificationCenter)
        
        notificationObservable.notifyObserver()

        
        XCTAssertTrue(notificationObserver.didHandleNotification)
        
        XCTAssertFalse(notificationObserver.didHandleNotification)
        
        
    }
    
    func testNotificationAsync() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let notificationCenter = NotificationCenter()
        
        let notificationObservable = NotificationObservable(notificationCenter: notificationCenter)
        
        
        let expectation = XCTNSNotificationExpectation(name: NotificationObservable.notificationName, object: notificationObservable,notificationCenter: notificationCenter)
        
        notificationObservable.notifyObserver()
        
        wait(for:[expectation], timeout: 0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
    }

}
