//
//  ViewController.swift
//  BMICalculator-Marathon
//
//  Created by User on 16.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImage = UIImageView()
    let titleLabel = UILabel()
    
    let sliderStackView = UIStackView()
    
    let heightView = SliderViewController(frame: .zero, label: "Height", maximum: 300, mesuare: "cm")
    let weightView = SliderViewController(frame: .zero, label: "Weight", maximum: 150, mesuare: "kg")
    
    let calculateButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    func style() {
        // BackgroundImage
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "CalculatorBackground")
        backgroundImage.contentMode = .scaleAspectFit
        
        // TitleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        titleLabel.text = "CALCULATE YOUR BMI"
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .darkGray
        
        // SlidersStackView
        sliderStackView.translatesAutoresizingMaskIntoConstraints = false
        sliderStackView.axis = .vertical
        sliderStackView.spacing = 0
        
        // CalculateButton
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.setTitle("CALCULATE", for: [])
        calculateButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        calculateButton.tintColor = .white
        calculateButton.backgroundColor = UIColor(named: "MainColor")
        calculateButton.layer.cornerRadius = 12
    }
    
    func layout() {
        sliderStackView.addArrangedSubview(heightView)
        sliderStackView.addArrangedSubview(weightView)
        
        view.addSubview(backgroundImage)
        view.addSubview(titleLabel)
        view.addSubview(sliderStackView)
        view.addSubview(calculateButton)
        
        let safeArea = view.safeAreaLayoutGuide
        
        // BackgroundImage
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor),
        ])
        
        // TitleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 220),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            safeArea.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 80)
        ])
        
        // SlidersStackView
        NSLayoutConstraint.activate([
            sliderStackView.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -20),
            sliderStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: sliderStackView.trailingAnchor, constant: 10),
        ])
        
        // CalculateButton
        NSLayoutConstraint.activate([
            calculateButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -40),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: calculateButton.trailingAnchor, constant: 20),
            calculateButton.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
}
