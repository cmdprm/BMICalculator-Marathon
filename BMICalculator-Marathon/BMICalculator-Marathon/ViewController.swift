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
    
    let heightStackView = UIStackView()
    let heightLabelsStackView = UIStackView()
    let heightLabel = UILabel()
    let heightNumberLabel = UILabel()
    let heightSlider = UISlider()
    
    let weightStackView = UIStackView()
    
    let testView = SliderViewController()
    
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
        
        // HeightStackView
        heightStackView.translatesAutoresizingMaskIntoConstraints = false
        heightStackView.axis = .vertical
        heightStackView.spacing = 8
        
        // HeightLabelsStackView
        heightLabelsStackView.translatesAutoresizingMaskIntoConstraints = false
        heightLabelsStackView.axis = .horizontal
        heightLabelsStackView.distribution = .fill
        
        // HeightLabel
        //testView.backgroundColor = .red
    }
    
    func layout() {
        view.addSubview(backgroundImage)
        view.addSubview(titleLabel)
        view.addSubview(testView)
        
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
        
        // TestView
        NSLayoutConstraint.activate([
            testView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
