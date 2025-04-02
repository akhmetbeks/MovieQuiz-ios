//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Sultan Akhmetbek on 31.03.2025.
//

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}
