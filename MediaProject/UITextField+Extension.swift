//
//  UITextField+Extension.swift
//  MediaProject
//
//  Created by 최민경 on 6/5/24.
//

import UIKit

extension UITextField {
    
    func configureTextField(placeholder: String) {
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        self.layer.cornerRadius = 6
        self.backgroundColor = .darkGray
        self.textAlignment = .center
        self.font = .systemFont(ofSize: 14)
        self.textColor = .white
    }
}
