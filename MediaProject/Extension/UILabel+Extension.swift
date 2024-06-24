//
//  UILabel+Extension.swift
//  MediaProject
//
//  Created by 최민경 on 6/24/24.
//

import UIKit

extension UILabel {
    
     func configureLabel(text: String, font: CGFloat, color: UIColor) {
        self.text = text
        self.font = .boldSystemFont(ofSize: font)
        self.backgroundColor = color
    }
    
    
}
