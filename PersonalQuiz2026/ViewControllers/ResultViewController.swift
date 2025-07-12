//
//  ResultViewController.swift
//  PersonalQuiz2026
//
//  Created by Yurii Luka on 12.07.2025.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}
