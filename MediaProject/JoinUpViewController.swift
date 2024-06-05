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
        textField.configureTextField(placeholder: "이메일 주소 또는 전화번호")
        return textField
    }()
    
    let passwordTextField = {
        let textField = UITextField()
        textField.configureTextField(placeholder: "비밀번호")
        return textField
    }()
    
    let nicknameTextField = {
        let textField = UITextField()
        textField.configureTextField(placeholder: "닉네임")
        return textField
    }()
    let locationTextField = {
        let textField = UITextField()
        textField.configureTextField(placeholder: "위치")
        return textField
    }()
    
    let codeTextField = {
        let textField = UITextField()
        textField.configureTextField(placeholder: "추천 코드 입력")
        return textField
    }()
    
    let joinButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 6
        return button
    }()
    
    let addInformationLabel: UILabel = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let addSwitch: UISwitch = {
        let sw = UISwitch()
        sw.isOn = true
        sw.onTintColor = .red
        return sw
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
        view.addSubview(passwordTextField)
        view.addSubview(nicknameTextField)
        view.addSubview(locationTextField)
        view.addSubview(codeTextField)
        view.addSubview(joinButton)
        view.addSubview(addInformationLabel)
        view.addSubview(addSwitch)
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
        
        passwordTextField.snp.makeConstraints { make in
            make.size.equalTo(emailTextField)
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.size.equalTo(emailTextField)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
        }
        
        locationTextField.snp.makeConstraints { make in
            make.size.equalTo(emailTextField)
            make.centerX.equalToSuperview()
            make.top.equalTo(nicknameTextField.snp.bottom).offset(15)
        }
        
        codeTextField.snp.makeConstraints { make in
            make.size.equalTo(emailTextField)
            make.centerX.equalToSuperview()
            make.top.equalTo(locationTextField.snp.bottom).offset(15)
        }
        
        joinButton.snp.makeConstraints { make in
            make.width.equalTo(emailTextField)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(codeTextField.snp.bottom).offset(15)
        }
        
        addInformationLabel.snp.makeConstraints { make in
            make.leading.equalTo(joinButton.snp.leading)
            make.top.equalTo(joinButton.snp.bottom).offset(20)
        }
        
        addSwitch.snp.makeConstraints { make in
            make.trailing.equalTo(joinButton.snp.trailing)
            make.top.equalTo(joinButton.snp.bottom).offset(10)
        }
        
    }
}
