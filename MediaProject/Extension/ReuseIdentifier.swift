//
//  ReuseIdentifier.swift
//  MediaProject
//
//  Created by 최민경 on 6/10/24.
//

import UIKit
 
protocol ReuseIdentifier {
    static var identifier: String { get }
}


extension ViewController: ReuseIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReuseIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
