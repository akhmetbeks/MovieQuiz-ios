//
//  QuestionFactory.swift
//  MovieQuiz
//
//  Created by Sultan Akhmetbek on 31.03.2025.
//

struct QuestionFactory: QuestionFactoryProtocol {
    weak var delegate: QuestionFactoryDelegate?
    
    private let questions: [QuizQuestion] = [
        QuizQuestion(
            image: "The Godfather",
            rating: 9.2,
            question: "Рейтинг этого фильма больше чем 6?",
            isCorrect: true),
        QuizQuestion(
            image: "The Dark Knight",
            rating: 9,
            question: "Рейтинг этого фильма больше чем 6?",
            isCorrect: true),
        QuizQuestion(
            image: "Kill Bill",
            rating: 8.1,
            question: "Рейтинг этого фильма больше чем 6?",
            isCorrect: true),
        QuizQuestion(
            image: "The Avengers",
            rating: 8,
            question: "Рейтинг этого фильма больше чем 6?",
            isCorrect: true),
        QuizQuestion(
            image: "Deadpool",
            rating: 9.2,
            question: "Рейтинг этого фильма больше чем 6?",
            isCorrect: true),
        QuizQuestion(
            image: "The Green Knight",
            rating: 9.2,
            question: "Рейтинг этого фильма больше чем 6?",
            isCorrect: true),
        QuizQuestion(
            image: "Old",
            rating: 9.2,
            question: "Рейтинг этого фильма больше чем 6?",
            isCorrect: false),
        QuizQuestion(
            image: "The Ice Age Adventures of Buck Wild",
            rating: 9.2,
            question: "Рейтинг этого фильма больше чем 6?",
            isCorrect: false),
        QuizQuestion(
            image: "Tesla",
            rating: 9.2,
            question: "Рейтинг этого фильма больше чем 6?",
            isCorrect: false),
        QuizQuestion(
            image: "Vivarium",
            rating: 9.2,
            question: "Рейтинг этого фильма больше чем 6?",
            isCorrect: false)
    ]
    
    func requestNextQuestion() {
        guard let index = (0..<questions.count).randomElement() else {
            delegate?.didReceiveNextQuestion(question: nil)
            return
        }
        
        let question = questions[safe: index]
        delegate?.didReceiveNextQuestion(question: question)
    }
}
