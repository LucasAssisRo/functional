//
//  Scaffolding.swift
//
//
//  Created by Lucas Assis Rodrigues on 5/9/24.
//

import Testing
import XCTest

final class AllTests: XCTestCase {
    func testAll() async {
      await XCTestScaffold.runAllTests(hostedBy: self)
    }
}
