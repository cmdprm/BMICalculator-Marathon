//
//  ViewController.swift
//  BMICalculator-Marathon
//
//  Created by User on 16.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
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

extension MainViewController {
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
        let mainColor = UIColor(named: "MainColor")!
        Styles.setupButton(button: calculateButton, bgcolor: mainColor, color: .white, title: "CALCULATE")
        calculateButton.addTarget(self, action: #selector(calculateButtonPressed), for: .primaryActionTriggered)
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

// MARK: - Actions
extension MainViewController {
    @objc func calculateButtonPressed() {
        
        let height = heightView.slider.value / 100
        let weight = weightView.slider.value
        
        let bmi = calculateBMI(height: height, weight: weight)
        
        // Transition to result view
        let resultVC = ResultViewController()
        resultVC.result = bmi
        self.present(resultVC, animated: true)
    }
    
    private func calculateBMI(height: Float, weight: Float) -> Float {
        let height2 = height * height
        let bmi = weight / height2
        
        return bmi
    }
}
