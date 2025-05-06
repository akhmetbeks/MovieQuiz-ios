//
//  MovieLoaderTests.swift
//  MovieQuiz
//
//  Created by Sultan Akhmetbek on 24.04.2025.
//
import XCTest
@testable import MovieQuiz

final class MovieLoaderTests: XCTestCase {
    func testSuccessLoading() throws {
        let stubNetworkClient = StubNetworkClient(emulateError: false)
        let loader = MoviesLoader(networkClient: stubNetworkClient)
        
        let expectation = expectation(description: "Loading expectation")
        
        loader.loadMovies { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data.items.count, 2)
                expectation.fulfill()
            case .failure(_):
                XCTFail("Failed to load movies")
            }
        }
        
        waitForExpectations(timeout: 1)
    }
    
    func testFailureLoading() throws {
        let stubNetworkClient = StubNetworkClient(emulateError: true)
        let loader = MoviesLoader(networkClient: stubNetworkClient)
        
        let expectation = expectation(description: "Loading expectation")
        
        loader.loadMovies { result in
            switch result {
            case .success(_):
                XCTFail("Movies loading should fail")
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 1)
    }
}
