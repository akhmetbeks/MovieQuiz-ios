//
//  ArrayTest.swift
//  MovieQuiz
//
//  Created by Sultan Akhmetbek on 24.04.2025.
//
import XCTest
@testable import MovieQuiz

final class ArrayTests: XCTestCase {
    func testGetValueInRage() throws {
        let array = [1, 1, 2, 4, 5]
        let value = array[safe: 2]
        XCTAssertNotNil(value)
        XCTAssertEqual(value, 2)
    }
    
    func testGetValueOutOfrange() throws {
        let array = [1, 1, 2, 4, 5]
        let value = array[safe: 10]
        XCTAssertNil(value)
    }
}
