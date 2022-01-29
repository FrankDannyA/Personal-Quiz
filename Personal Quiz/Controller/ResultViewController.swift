//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by Даниил Франк on 29.01.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var resultAnswersLabel: UILabel!
    @IBOutlet weak var resultDefenitionLabel: UILabel!
    
    //MARK: - Public properties
    var responses: [Answer]!

    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateResult()
    }
    
    //MARK: - Private func
    private func setupUI(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesBackButton = true
    }
    
    private func updateResult(){
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = responses.map{ $0.type}
        
        for animal in animals {
            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value}
        
        guard let mostFrequencyOfAnimals = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyOfAnimals)
    }
    
    private func updateUI(with animal: AnimalType){
        resultAnswersLabel.text = "Вы - \(animal.rawValue)"
        resultDefenitionLabel.text = "\(animal.divinition)"
    }

}
