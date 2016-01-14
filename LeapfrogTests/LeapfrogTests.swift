//
//  LeapfrogTests.swift
//  LeapfrogTests
//
//  Created by Christopher Larsen on 2016-01-13.
//  Copyright © 2016 DRG. All rights reserved.
//

import XCTest
@testable import Leapfrog

class LeapfrogTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        
        let expectation = self.expectationWithDescription("Eventually executes Dispatch")

        Dispatch.after(0.01) { () -> Void in
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(1.0) { (error) -> Void in
            XCTAssertNil(error)
        }
    }
    
    func testPerformanceExample() {
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
