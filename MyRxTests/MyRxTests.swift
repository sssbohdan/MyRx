//
//  MyRxTests.swift
//  MyRxTests
//
//  Created by Bohdan Savych on 07/01/2021.
//

import XCTest

@testable import MyRx

class MyRxTests: XCTestCase {
  func test1() {
    let sequence = Observable<Int, Never> { producer in
      producer(.next(1))
      producer(.next(2))
      producer(.next(3))
    }

    var acc = [Observable<Int, Never>.Event]()
    sequence.observe { event in
      acc.append(event)
    }

    XCTAssertEqual([Observable<Int, Never>.Event.next(1), .next(2), .next(3)], acc)
  }
}
