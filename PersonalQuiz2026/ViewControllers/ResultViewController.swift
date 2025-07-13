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
        getResult()
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func getResult() {
        var animalChosen: [AnimalType] = []
        
        for answer in answersChosen {
            animalChosen.append(answer.type)
        }
        
        var frequencyDict: [AnimalType : Int] = [:]
        for animal in animalChosen {
            frequencyDict[animal, default: 0] += 1
        }
        
        guard let (mostFrequentElement, _) = frequencyDict.max(by: { $0.value < $1.value }) else { return }
        let mostCommonAnimal = mostFrequentElement
        
        resultLabel.text = "Вы - \(mostCommonAnimal.rawValue)"
        definitionLabel.text = mostCommonAnimal.definition
    }
}
