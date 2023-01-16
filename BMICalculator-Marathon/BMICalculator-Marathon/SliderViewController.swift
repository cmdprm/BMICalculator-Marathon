//
//  SliderViewController.swift
//  BMICalculator-Marathon
//
//  Created by User on 16.01.2023.
//

import UIKit

class SliderViewController: UIView {
    
    let heightStackView = UIStackView()
    let heightLabelsStackView = UIStackView()
    let heightLabel = UILabel()
    let heightNumberLabel = UILabel()
    let heightSlider = UISlider()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError ("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}

extension SliderViewController {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        // HeightStackView
        heightStackView.translatesAutoresizingMaskIntoConstraints = false
        heightStackView.axis = .vertical
        heightStackView.spacing = 8
        
        // HeightLabelsStackView
        heightLabelsStackView.translatesAutoresizingMaskIntoConstraints = false
        heightLabelsStackView.axis = .horizontal
        heightLabelsStackView.distribution = .fill
        
        // HeightLabel
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.text = "Hello"
    }
    
    func layout() {
        addSubview(heightLabel)
        
        NSLayoutConstraint.activate([
            heightLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            heightLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
}
