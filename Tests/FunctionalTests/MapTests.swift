//
//  MapTests.swift
//
//
//  Created by Lucas Assis Rodrigues on 5/9/24.
//

import Foundation
import FunctionalUtilityTypes
import Testing

@Suite("Map tests") 
struct MapTests {
    @Test("Test map")
    func testMap() {
        let map = Map<String, _>(\.isEmpty)
        #expect(map(""))
        #expect(!map("not empty"))
    }

    @Test("Test throwing map")
    func testThrowingMap() {
        let throwingMap = ThrowingMap { (string: String) in
            try URL(string, strategy: .url)
        }
        
        #expect(throws: (any Error).self) { try throwingMap("") }
        #expect(throws: (any Error).self) { try throwingMap("not url") }
        #expect(throws: Never.self) { try throwingMap("https://www.test.com") }
    }
}
