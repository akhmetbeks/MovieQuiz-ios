//
//  MovieQuizPresenterTests.swift
//  MovieQuizPresenterTests
//
//  Created by Sultan Akhmetbek on 06.05.2025.
//

import XCTest
@testable import MovieQuiz

final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
    func show(quiz step: QuizStepViewModel) {
    
    }
    
    func highlightImageBorder(isCorrect: Bool) {
    
    }
    
    func showLoadingIndicator() {
    
    }
    
    func hideLoadingIndicator() {
    
    }
    
    func showNetworkError(message: String) {
    
    }
    
    func showStatisticsAlert() {
        
    }
}

final class MovieQuizPresenterTests: XCTestCase {

    func testPresenterConvertModel() throws {
      let viewControllerMock = MovieQuizViewControllerMock()
      let sut = MovieQuizPresenter(viewController: viewControllerMock)
      
      let emptyData = Data()
      let question = QuizQuestion(image: emptyData, text: "Question Text", isCorrect: true)
      let viewModel = sut.convert(model: question)
      
      XCTAssertNotNil(viewModel.image)
      XCTAssertEqual(viewModel.question, "Question Text")
      XCTAssertEqual(viewModel.questionNumber, "1/10")
  }
}
