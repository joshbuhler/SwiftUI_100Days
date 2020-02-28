//
//  SwiftUI_day25Tests.swift
//  SwiftUI_day25Tests
//
//  Created by Joshua Buhler on 2/24/20.
//  Copyright © 2020 jb. All rights reserved.
//

import XCTest
@testable import SwiftUI_day25

class SwiftUI_day25Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_handGreater() {
        let rock = Hand.rock
        let paper = Hand.paper
        let scissor = Hand.scissor
        let raptor = Hand.raptor
        
        XCTAssertTrue(rock > raptor)
        XCTAssertTrue(paper > rock)
        XCTAssertTrue(scissor > paper)
        XCTAssertTrue(raptor > scissor)
        
        XCTAssertFalse(rock > paper)
        XCTAssertFalse(rock > rock)
        XCTAssertFalse(paper > scissor)
        XCTAssertFalse(paper > paper)
        XCTAssertFalse(scissor > rock)
        XCTAssertFalse(scissor > scissor)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
