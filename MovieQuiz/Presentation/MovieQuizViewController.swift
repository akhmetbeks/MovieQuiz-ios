import UIKit

final class MovieQuizViewController: UIViewController {
    
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
    
    private var currentQuestionIndex = 0
    private var correctAnswers = 0
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        
        if let font = UIFont(name: "YS Display-Medium", size: 20) {
            counterLabel.font = font
        }
        if let font = UIFont(name: "YS Display-Bold", size: 23) {
            textLabel.font = font
        }
        
        let question = questions[currentQuestionIndex]
        let viewModel =  convert(model: question)
        show(quiz: viewModel)
    }
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        let isCorrect = questions[currentQuestionIndex].isCorrect == true
        showAnswerResult(isCorrect: isCorrect, sender: sender)
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        let isCorrect = questions[currentQuestionIndex].isCorrect == false
        showAnswerResult(isCorrect: isCorrect, sender: sender)
    }
    
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let questionStep = QuizStepViewModel(
            image: UIImage(named: model.image) ?? UIImage(),
            question: model.question,
            questionNumber: "\(currentQuestionIndex + 1)/\(questions.count)")
        return questionStep
    }
    
    private func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    
    private func showAnswerResult(isCorrect: Bool, sender: UIButton) {
        sender.isEnabled = false
        
        if isCorrect {
            correctAnswers += 1
        }
        
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            sender.isEnabled = true
            self.showNextQuestionOrResult()
        }
    }
    
    private func showNextQuestionOrResult() {
        if currentQuestionIndex + 1 == questions.count {
            let score = "\(correctAnswers)/\(questions.count)"
            let text = "Ваш результат \(score)"
            let viewModel = QuizResultViewModel(
                title: "Этот раунд окончен!",
                text: text,
                buttonText: "Сыграть еще раз")
            showAlert(result: viewModel)
            return
        }
        
        imageView.layer.borderWidth = 0
        currentQuestionIndex += 1
        let nextQuestion = questions[currentQuestionIndex]
        let viewModel =  convert(model: nextQuestion)
        show(quiz: viewModel)
    }
    
    private func showAlert(result: QuizResultViewModel) {
        let alert = UIAlertController(
            title: result.title,
            message: result.text,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
            self.imageView.layer.borderWidth = 0
            self.currentQuestionIndex = 0
            self.correctAnswers = 0
            let question = self.questions[self.currentQuestionIndex]
            let viewModel = self.convert(model: question)
            self.show(quiz: viewModel)
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

struct QuizQuestion {
    let image: String
    let rating: Double
    let question: String
    let isCorrect: Bool
}

struct QuizStepViewModel {
    let image: UIImage
    let question: String
    let questionNumber: String
}

struct QuizResultViewModel {
    let title: String
    let text: String
    let buttonText: String
}


/*
 Mock-данные
 
 
 Картинка: The Godfather
 Настоящий рейтинг: 9,2
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: The Dark Knight
 Настоящий рейтинг: 9
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: Kill Bill
 Настоящий рейтинг: 8,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: The Avengers
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: Deadpool
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: The Green Knight
 Настоящий рейтинг: 6,6
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: Old
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ


 Картинка: The Ice Age Adventures of Buck Wild
 Настоящий рейтинг: 4,3
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ


 Картинка: Tesla
 Настоящий рейтинг: 5,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ


 Картинка: Vivarium
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 */
