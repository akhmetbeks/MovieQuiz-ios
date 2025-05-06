//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by Sultan Akhmetbek on 06.05.2025.
//

protocol MovieQuizViewControllerProtocol: AnyObject {
    func show(quiz step: QuizStepViewModel)
    
    func highlightImageBorder(isCorrect: Bool)
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func showNetworkError(message: String)
    
    func showStatisticsAlert()
}
