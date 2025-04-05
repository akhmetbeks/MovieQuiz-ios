//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Sultan Akhmetbek on 02.04.2025.
//
import UIKit

class AlertPresenter: AlertPresenterProtocol {
    weak var delegate: AlertPresenterDelegate?
    
    func showAlert(_ result: AlertModel) {
        let alert = UIAlertController(
            title: result.title,
            message: result.message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
            result.completion()
        }
        
        alert.addAction(action)
        delegate?.presentAlert(alert)
    }
}
