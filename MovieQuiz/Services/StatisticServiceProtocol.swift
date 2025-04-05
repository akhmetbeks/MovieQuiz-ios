//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Sultan Akhmetbek on 02.04.2025.
//

protocol StatisticServiceProtocol {
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
    var correctAnswers: Int { get }
    
    func store(correct count: Int, total amount: Int)
}
