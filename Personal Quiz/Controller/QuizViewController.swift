//
//  QuizViewController.swift
//  Personal Quiz
//
//  Created by Даниил Франк on 29.01.2022.
//

import UIKit

class QuizViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!
    
    @IBOutlet var singleButton: [UIButton]!
    @IBOutlet var multipleLable: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    
    //MARK: - Private properties
    private let questions = Question.getQuestion()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK: - IB Actions
    
    @IBAction func singleAnserButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        guard let currentIndex = singleButton.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answersChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers){
            if multipleSwitch.isOn{
                answersChoosen.append(answer)
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChoosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    
    //MARK: - Private Method
  
    private func updateUI(){
        navigationController?.navigationBar.prefersLargeTitles = true
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestion = questions[questionIndex]
        let totalProgress = Float(questionIndex) / Float(questions.count)
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        let currentAnswer = currentQuestion.answers
        
        switch currentQuestion.type {
        case .single:
            updateSingleStackView(using: currentAnswer)
        case .multiple:
            updateMultipleStackView(using: currentAnswer)
        case .ranged:
            updateRangedStackView(using: currentAnswer)
        }
    }
    
    private func updateSingleStackView(using answers: [Answer]){
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButton, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func updateMultipleStackView(using answers: [Answer]){
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLable, answers){
            label.text = answer.text
        }
    }
    
    private func updateRangedStackView(using answers: [Answer]){
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
    //MARK: - Navigation
    private func nextQuestion(){
        questionIndex += 1
        
        if questionIndex < questions.count{
            updateUI()
        } else {
            performSegue(withIdentifier: "Result", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Result" else { return }
        let resultVC = segue.destination as! ResultViewController
        resultVC.responses = answersChoosen
    }
}
