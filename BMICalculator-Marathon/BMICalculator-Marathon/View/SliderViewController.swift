//
//  SliderViewController.swift
//  BMICalculator-Marathon
//
//  Created by User on 16.01.2023.
//

import UIKit

class SliderViewController: UIView {
    
    let stackView = UIStackView()
    let labelsStackView = UIStackView()
    let label = UILabel()
    let numberLabel = UILabel()
    let slider = UISlider()
    
    let labelText: String
    let sliderMaximum: Float
    let mesuareLabel: String
    
    init(frame: CGRect, label: String, maximum: Float, mesuare: String) {
        self.labelText = label
        self.sliderMaximum = maximum
        self.mesuareLabel = mesuare
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError ("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 90)
    }
    
}

extension SliderViewController {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        // StackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        // LabelsStackView
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.axis = .horizontal
        labelsStackView.distribution = .fill
        
        // Label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = labelText
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.textColor = .darkGray
        
        // Slider
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.tintColor = UIColor(named: "MainColor")
        slider.thumbTintColor = UIColor(named: "MainColor")
        slider.alpha = 0.8
        slider.maximumValue = sliderMaximum
        slider.value = sliderMaximum / 2
        slider.addTarget(self, action: #selector(sliderValueChaned), for: .valueChanged)
        
        // NumberLabel
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.text = String(format: "%.0f", slider.value) + mesuareLabel
        numberLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        numberLabel.textColor = .darkGray
    }
    
    func layout() {
        labelsStackView.addArrangedSubview(label)
        labelsStackView.addArrangedSubview(numberLabel)
        
        stackView.addArrangedSubview(labelsStackView)
        stackView.addArrangedSubview(slider)
        
        addSubview(stackView)
        
        // LabelsStackView
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            trailingAnchor.constraint(equalTo: labelsStackView.trailingAnchor, constant: 10)
        ])
    }
    
}

extension SliderViewController {
    @objc func sliderValueChaned() {
        let number = slider.value
        numberLabel.text = String(format: "%.0f", number) + mesuareLabel
    }
}
