//
//  MovieQuizUITest.swift
//  MovieQuizUITest
//
//  Created by Sultan Akhmetbek on 24.04.2025.
//

import XCTest

final class MovieQuizUITest: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        app = nil
    }
    
    @MainActor
    func testYesButton() throws {
        sleep(3)
        
        let firstImage = app.images["Poster"]
        let firstImageData = firstImage.screenshot().pngRepresentation
        
        app.buttons["Yes"].tap()
        sleep(3)
        
        let secondImage = app.images["Poster"]
        let secondImageData = secondImage.screenshot().pngRepresentation
        
        let indexLabel = app.staticTexts["Index"]
        
        XCTAssertEqual(indexLabel.label, "2/10")
        XCTAssertNotEqual(firstImageData, secondImageData)
    }
    
    @MainActor
    func testNoButton() throws {
        sleep(3)
        
        let firstImage = app.images["Poster"]
        let firstImageData = firstImage.screenshot().pngRepresentation
        
        app.buttons["No"].tap()
        sleep(3)
        
        let secondImage = app.images["Poster"]
        let secondImageData = secondImage.screenshot().pngRepresentation
        
        let indexLabel = app.staticTexts["Index"]
        
        XCTAssertEqual(indexLabel.label, "2/10")
        XCTAssertNotEqual(firstImageData, secondImageData)
    }
    
    @MainActor
    func testResultAlert() throws {
        for _ in 0..<10 {
            sleep(3)
            app.buttons["No"].tap()
        }
        
        sleep(3)
        
        let alert = app.alerts["Alert"]
        let title = alert.label
        let actionButton = alert.buttons.firstMatch
        
        XCTAssertTrue(alert.exists)
        XCTAssertEqual("Этот раунд окончен!", title)
        XCTAssertEqual("Сыграть еще раз", actionButton.label)
    }
    
    @MainActor
    func testResultAlertButton() throws {
        for _ in 0..<10 {
            sleep(3)
            app.buttons["No"].tap()
        }
        
        sleep(3)
        
        let alert = app.alerts["Alert"]
        alert.buttons.firstMatch.tap()
        
        sleep(3)
        
        let indexLabel = app.staticTexts["Index"]
        
        XCTAssertFalse(alert.exists)
        XCTAssertEqual(indexLabel.label, "1/10")
    }
}
