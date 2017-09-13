//
//  ShopsTest.swift
//  MadridShopsTests
//
//  Created by Manuel Colmenero Navarro on 7/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import XCTest
import MadridShops

class ShopsTest: XCTestCase {
    
    // sut -> Sustituible Under Test
    func testGivenEmptyShopsNumberShopsIsZero() {
        let sut  = Shops()
        XCTAssertEqual(0, sut.count())
    }

    func testGivenShopsWithOneElementNumberShopsIsOne() {
        let sut  = Shops()
        sut.add(shop: Shop(name: "Shop"))
        XCTAssertEqual(1, sut.count())
    }
}
