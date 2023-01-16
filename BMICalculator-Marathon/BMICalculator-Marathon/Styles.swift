//
//  Styles.swift
//  BMICalculator-Marathon
//
//  Created by User on 16.01.2023.
//

import UIKit

class Styles {
    
    static func setupStackLabel(label: UILabel, f_size: CGFloat, f_weight: UIFont.Weight, text: String) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: f_size, weight: f_weight)
        label.textColor = .white
        label.textAlignment = .center
        label.text = text
    }
    
    static func setupButton(button: UIButton, bgcolor: UIColor, color: UIColor, title: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: [])
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.tintColor = color
        button.backgroundColor = bgcolor
        button.layer.cornerRadius = 12
    }
    
}
