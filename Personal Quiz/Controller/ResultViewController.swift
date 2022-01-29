//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by Даниил Франк on 29.01.2022.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
