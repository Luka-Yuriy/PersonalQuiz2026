//
//  ResultViewController.swift
//  PersonalQuiz2026
//
//  Created by Yurii Luka on 12.07.2025.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}
    
//MARK: Private Methods
extension ResultViewController {
    private func updateResult() {
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = answersChosen.map { $0.type }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
            
            let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
            guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
            
            updateUI(with: mostFrequencyAnimal)
        }
    }
    private func updateUI(with animal: AnimalType) {
        resultLabel.text = "Вы - \(animal.rawValue)!"
        definitionLabel.text = animal.definition
    }
}
