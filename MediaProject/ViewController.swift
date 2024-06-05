//
//  ViewController.swift
//  MediaProject
//
//  Created by 최민경 on 6/4/24.
//

//import UIKit
//
//class ViewController: UIViewController {
//    
//    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
//
//
//}
//

//
//  JoinViewController.swift
//  MediaProject
//
//  Created by 최민경 on 6/4/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.configureImageView(imageName: "명량")
        return imageView
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let playBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        return button
    }()
    
    let playImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.image = UIImage(named: "play_normal")
        return imageView
    }()
    
    let likeBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.backgroundColor = .darkGray
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setTitle(" 내가 찜한 리스트", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    let nowHotLabel: UILabel = {
        let label = UILabel()
        label.text = "지금 뜨는 콘텐츠"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    let firstContentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        imageView.configureImageView(imageName: "부산행")
        return imageView
    }()
    
    let secondContentImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .systemYellow
        imageView.configureImageView(imageName: "도둑들")
        return imageView
    }()
    
    let thirdContentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGreen
        imageView.configureImageView(imageName: "극한직업")
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
        configureUI(title: "마일리")
       setUpNavi()
    }
    
    func setUpNavi() {
        let signUp = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(signUpBtnTapped))
        navigationItem.rightBarButtonItem = signUp
        print("==")
    }
    
    
    @objc func signUpBtnTapped(_ sender: UIButton) {
        let vc = JoinUpViewController()
        present(vc, animated: true)
    }
    
    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(mainImageView)
        view.addSubview(playBtn)
        view.addSubview(playImageView)
        view.addSubview(likeBtn)
        view.addSubview(nowHotLabel)
        view.addSubview(firstContentImageView)
        view.addSubview(secondContentImageView)
        view.addSubview(thirdContentImageView)
    }
    
    private func setupConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(mainImageView.snp.bottom).offset(4)
        }
        
        playBtn.snp.makeConstraints { make in
            make.leading.equalTo(mainImageView).offset(12)
            make.bottom.equalTo(mainImageView).inset(12)
            make.width.equalTo(mainImageView.snp.width).multipliedBy(0.45)
            make.height.equalTo(mainImageView.snp.height).multipliedBy(0.1)
        }
        
        playImageView.snp.makeConstraints { make in
            make.edges.equalTo(playBtn).inset(8)
        }
        
        likeBtn.snp.makeConstraints { make in
            make.trailing.equalTo(mainImageView).offset(-12)
            make.bottom.equalTo(mainImageView).inset(12)
            make.size.equalTo(playBtn)
        }
        
        nowHotLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.bottom).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(8)
        }
        
        firstContentImageView.snp.makeConstraints { make in
            make.leading.equalTo(mainImageView)
            make.top.equalTo(nowHotLabel.snp.bottom).offset(4)
            make.height.equalTo(firstContentImageView.snp.width).multipliedBy(1.5)
        }
        
        secondContentImageView.snp.makeConstraints { make in
            make.top.size.equalTo(firstContentImageView)
            make.leading.equalTo(firstContentImageView.snp.trailing).offset(8)
        }
        
        thirdContentImageView.snp.makeConstraints { make in
            make.top.size.equalTo(secondContentImageView)
            make.leading.equalTo(secondContentImageView.snp.trailing).offset(8)
            make.trailing.equalTo(mainImageView.snp.trailing)
        }
    }
}

