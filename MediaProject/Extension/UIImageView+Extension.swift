//
//  UIImageView+Extension.swift
//  MediaProject
//
//  Created by 최민경 on 6/5/24.
//

import Foundation
import UIKit

extension UIImageView {
    func configureImageView(imageName: String) {
        self.layer.cornerRadius = 10
        self.image = UIImage(named: imageName)
        self.contentMode = .scaleAspectFill
        self.layer.masksToBounds = true
    }
}
