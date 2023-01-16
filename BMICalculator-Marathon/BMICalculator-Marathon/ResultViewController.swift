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
        backgroundImage.contentMode = .scaleAspectFit
        
        // StackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        // TextLabel
        setupStackLabel(label: textLabel, f_size: 34, f_weight: .heavy, text: "YOUR RESULT")
        
        // ResultLabel
        setupStackLabel(label: resultLabel, f_size: 64, f_weight: .bold, text: "19.5")
        
        // AdviceLabel
        setupStackLabel(label: adviceLabel, f_size: 20, f_weight: .light, text: "EAT SOME MORE SNACKS!")
    }
    
    // MARK: - Move from here!!
    private func setupStackLabel(label: UILabel, f_size: CGFloat, f_weight: UIFont.Weight, text: String) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: f_size, weight: f_weight)
        label.textColor = .white
        label.textAlignment = .center
        label.text = text
    }
    
    func layout() {
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(resultLabel)
        stackView.addArrangedSubview(adviceLabel)
        
        view.addSubview(backgroundImage)
        view.addSubview(stackView)
        
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
    }
}
