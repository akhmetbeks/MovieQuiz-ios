//
//  QuestionFactory.swift
//  MovieQuiz
//
//  Created by Sultan Akhmetbek on 31.03.2025.
//
import Foundation

class QuestionFactory: QuestionFactoryProtocol {
    private let moviesLoader: MoviesLoading
    private weak var delegate: QuestionFactoryDelegate?
    private var movies: [MostPopularMovie] = []
    
    init(moviesLoader: MoviesLoading, delegate: QuestionFactoryDelegate?) {
        self.moviesLoader = moviesLoader
        self.delegate = delegate
    }
    
    
    
//    private let questions: [QuizQuestion] = [
//        QuizQuestion(
//            image: "The Godfather",
//            rating: 9.2,
//            question: "Рейтинг этого фильма больше чем 6?",
//            isCorrect: true),
//        QuizQuestion(
//            image: "The Dark Knight",
//            rating: 9,
//            question: "Рейтинг этого фильма больше чем 6?",
//            isCorrect: true),
//        QuizQuestion(
//            image: "Kill Bill",
//            rating: 8.1,
//            question: "Рейтинг этого фильма больше чем 6?",
//            isCorrect: true),
//        QuizQuestion(
//            image: "The Avengers",
//            rating: 8,
//            question: "Рейтинг этого фильма больше чем 6?",
//            isCorrect: true),
//        QuizQuestion(
//            image: "Deadpool",
//            rating: 9.2,
//            question: "Рейтинг этого фильма больше чем 6?",
//            isCorrect: true),
//        QuizQuestion(
//            image: "The Green Knight",
//            rating: 9.2,
//            question: "Рейтинг этого фильма больше чем 6?",
//            isCorrect: true),
//        QuizQuestion(
//            image: "Old",
//            rating: 9.2,
//            question: "Рейтинг этого фильма больше чем 6?",
//            isCorrect: false),
//        QuizQuestion(
//            image: "The Ice Age Adventures of Buck Wild",
//            rating: 9.2,
//            question: "Рейтинг этого фильма больше чем 6?",
//            isCorrect: false),
//        QuizQuestion(
//            image: "Tesla",
//            rating: 9.2,
//            question: "Рейтинг этого фильма больше чем 6?",
//            isCorrect: false),
//        QuizQuestion(
//            image: "Vivarium",
//            rating: 9.2,
//            question: "Рейтинг этого фильма больше чем 6?",
//            isCorrect: false)
//    ]
    
    func loadData() {
        moviesLoader.loadMovies { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }

                switch result {
                case .success(let mostPopularMovies):
                    self.movies = mostPopularMovies.items
                    self.delegate?.didLoadDataFromServer()
                case .failure(let error):
                    self.delegate?.didFailToLoadData(with: error)
                }
            }
        }
    }
    
    func requestNextQuestion() {
        DispatchQueue.global().async { [weak self] in
               guard let self = self else { return }
               let index = (0..<self.movies.count).randomElement() ?? 0
               
               guard let movie = self.movies[safe: index] else { return }
               
               var imageData = Data()
              
              do {
                   imageData = try Data(contentsOf: movie.resizedImageURL)
               } catch {
                   print("Failed to load image")
               }
               
               let rating = Float(movie.rating ?? "0.0") ?? 0
               
               let text = "Рейтинг этого фильма больше чем 7?"
               let correctAnswer = rating > 7
               
               let question = QuizQuestion(image: imageData,
                                            text: text,
                                            isCorrect: correctAnswer)
               
               DispatchQueue.main.async { [weak self] in
                   guard let self = self else { return }
                   self.delegate?.didReceiveNextQuestion(question: question)
               }
           }
    }
}
