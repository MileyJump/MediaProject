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
        label.font = .boldSystemFont(ofSize: 35)
        return label
    }()
    
    let emailTextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 주소 또는 전화번호"
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .lightGray
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 14)
        textField.textColor = .white
        return textField
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureHierarchy()
        configureLayout()
        
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
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.8)
            make.height.equalTo(35)
        }
    }
}
