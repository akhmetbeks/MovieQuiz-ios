//
//  GameResult.swift
//  MovieQuiz
//
//  Created by Sultan Akhmetbek on 02.04.2025.
//
import Foundation

struct GameResult {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThan(_ other: GameResult) -> Bool {
        return correct > other.correct
    }
}
