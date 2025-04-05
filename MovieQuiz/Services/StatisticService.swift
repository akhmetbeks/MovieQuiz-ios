//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Sultan Akhmetbek on 03.04.2025.
//

import Foundation

class StatisticService {
    private let storage: UserDefaults = .standard
    
    private enum Keys: String {
        case correctAnswers
        case gamesCount
        case correct
        case total
        case date
    }
}

extension StatisticService: StatisticServiceProtocol {
    var correctAnswers: Int {
        get {
            storage.integer(forKey: Keys.correctAnswers.rawValue)
        }
        
        set {
            storage.set(newValue, forKey: Keys.correctAnswers.rawValue)
        }
    }
    
    var totalAccuracy: Double {
        guard gamesCount > 0 else {
            return 0.0
        }
        
        return (Double(correctAnswers) / Double(gamesCount)) * 10
    }
    
    var gamesCount: Int {
        get {
            storage.integer(forKey: Keys.gamesCount.rawValue)
        }
        
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.correct.rawValue)
            let total = storage.integer(forKey: Keys.total.rawValue)
            let date = storage.object(forKey: Keys.date.rawValue) as? Date ?? Date()
            
            return GameResult(correct: correct, total: total, date: date)
        }
        
        set {
            storage.set(newValue.correct, forKey: Keys.correct.rawValue)
            storage.set(newValue.total, forKey: Keys.total.rawValue)
            storage.set(newValue.date, forKey: Keys.date.rawValue)
        }
    }
    
    func store(correct count: Int, total amount: Int) {
        gamesCount += 1
        correctAnswers += count
        if count > bestGame.correct {
            storage.set(count, forKey: Keys.correct.rawValue)
            storage.set(amount, forKey: Keys.total.rawValue)
            storage.set(Date(), forKey: Keys.date.rawValue)
        }
    }
}
