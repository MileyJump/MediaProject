//
//  JoinViewController.swift
//  MediaProject
//
//  Created by 최민경 on 6/4/24.
//

import UIKit
import SnapKit

class JoinUpViewController: UIViewController {
    
    let titleLabel = {
        let label = UILabel()
        label.text = "JACKFLIX"
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let emailTextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 주소 또는 전화번호"
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .lightGray
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureUI(title: "")
//        configureLayout()
        view.backgroundColor = .black
        
    }
    
    func configureHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
        }
        
    }
}
