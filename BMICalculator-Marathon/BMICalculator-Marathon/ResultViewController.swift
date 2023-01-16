//
//  ResultViewController.swift
//  BMICalculator-Marathon
//
//  Created by User on 16.01.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    let backgroundImage = UIImageView()
    
    let stackView = UIStackView()
    let textLabel = UILabel()
    let resultLabel = UILabel()
    let adviceLabel = UILabel()
    
    let recalButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ResultViewController {
    func style() {
        // View
        view.backgroundColor = UIColor(named: "BGBlue")
        
        // BackgroundImage
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "ResultBackground")
        backgroundImage.contentMode = .scaleAspectFill
        
        // StackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        // TextLabel
        Styles.setupStackLabel(label: textLabel, f_size: 34, f_weight: .heavy, text: "YOUR RESULT")
        
        // ResultLabel
        Styles.setupStackLabel(label: resultLabel, f_size: 64, f_weight: .bold, text: "19.5")
        
        // AdviceLabel
        Styles.setupStackLabel(label: adviceLabel, f_size: 20, f_weight: .light, text: "EAT SOME MORE SNACKS!")
        
        // RecalButton
        Styles.setupButton(button: recalButton, bgcolor: .white, color: .darkGray, title: "RECALCULATE")
        recalButton.addTarget(self, action: #selector(recalButtonPressed), for: .primaryActionTriggered)
    }
    
    func layout() {
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(resultLabel)
        stackView.addArrangedSubview(adviceLabel)
        
        view.addSubview(backgroundImage)
        view.addSubview(stackView)
        view.addSubview(recalButton)
        
        let safeArea = view.safeAreaLayoutGuide
        
        // BackgroundImage
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor),
        ])
        
        // StackView
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        // RecalButton
        NSLayoutConstraint.activate([
            recalButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
            recalButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            safeArea.trailingAnchor.constraint(equalTo: recalButton.trailingAnchor, constant: 20),
            recalButton.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
}

// MARK: - Actions
extension ResultViewController {
    @objc func recalButtonPressed() {
        self.dismiss(animated: true)
    }
}
