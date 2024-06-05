//
//  UIViewController+Extension.swift
//  MediaProject
//
//  Created by 최민경 on 6/5/24.
//

import UIKit

extension UIViewController {
    func configureUI(title: String) {
        view.backgroundColor = .black
        navigationItem.title = title
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
    }
}
