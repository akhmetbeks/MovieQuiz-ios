//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Sultan Akhmetbek on 02.04.2025.
//
import UIKit

class AlertPresenter {
    weak var delegate: UIViewController?
    
    func showAlert(_ result: AlertModel) {
        let alert = UIAlertController(
            title: result.title,
            message: result.message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
            result.completion()
        }
        
        alert.addAction(action)
        delegate?.present(alert, animated: true, completion: nil)
    }
}
