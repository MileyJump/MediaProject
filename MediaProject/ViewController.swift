//
//  ViewController.swift
//  MediaProject
//
//  Created by 최민경 on 6/4/24.
//


import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.configureImageView(imageName: "background")
        return imageView
    }()
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.configureImageView(imageName: "명량")
        return imageView
    }()
    
    let taglabel: UILabel = {
        let label = UILabel()
        label.text = "응원하고픈 · 흥미진진 · 사극 · 전투 · 한국작품"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let playButtonImageView: UIImageView = {
        let button = UIImageView()
        button.layer.cornerRadius = 6
        button.backgroundColor = .white
        return button
    }()
    
    let playButton: UIImageView = {
        let button = UIImageView()
        button.image = UIImage(named: "play_normal")
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    
    
    let mylikeList: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setTitle(" 내가 찜한 리스트", for: .normal)
        button.backgroundColor = .darkGray
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let nowHotContentLabel: UILabel = {
        let label = UILabel()
        label.text = "지금 뜨는 콘텐츠"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let firstContentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.configureImageView(imageName: "베테랑")
        return imageView
    }()
    
    let secondContentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.configureImageView(imageName: "암살")
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let thirdContentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.configureImageView(imageName: "해운대")
        return imageView
    }()
    
    let top10: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let newEpisodeLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 에피소드"
        return label
    }()
    
    let WatchNow: UILabel = {
        let label = UILabel()
        label.text = "새로운 시리즈"
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureNavigation()
        
    }
    
    func configureNavigation() {
        navigationItem.title = "마일리님"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let joinUp = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(joinUpButtonTapped))
        navigationItem.rightBarButtonItem = joinUp
        
        navigationItem.backButtonTitle = ""
    }
    
    @objc func joinUpButtonTapped() {
        print(#function)
        let vc = JoinUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func configureHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(mainImageView)
        view.addSubview(taglabel)
        view.addSubview(playButtonImageView)
        view.addSubview(playButton)
        view.addSubview(mylikeList)
        view.addSubview(nowHotContentLabel)
        view.addSubview(firstContentImageView)
        view.addSubview(secondContentImageView)
        view.addSubview(thirdContentImageView)
    }
    
    func configureLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.top).offset(10)
            make.horizontalEdges.equalTo(backgroundImageView.snp.horizontalEdges).inset(16)
            make.bottom.equalTo(backgroundImageView.snp.bottom).inset(6)
            
        }
        
        playButtonImageView.snp.makeConstraints { make in
            make.leading.equalTo(mainImageView.snp.leading).inset(10)
            make.height.equalTo(mainImageView.snp.height).multipliedBy(0.08)
            make.bottom.equalTo(mainImageView.snp.bottom).inset(8)
            make.width.equalTo(mainImageView.snp.width).multipliedBy(0.45)
        }
        
        playButton.snp.makeConstraints { make in
            make.verticalEdges.equalTo(playButtonImageView).inset(3)
            make.horizontalEdges.equalTo(playButtonImageView)
        }
        
        taglabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(mainImageView).inset(20)
            make.bottom.equalTo(playButtonImageView.snp.top).offset(-10)
        }
        
        mylikeList.snp.makeConstraints { make in
            make.trailing.equalTo(mainImageView.snp.trailing).inset(10)
            make.size.equalTo(playButtonImageView)
            make.bottom.equalTo(mainImageView.snp.bottom).inset(8)
        }
        
        nowHotContentLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(mainImageView.snp.bottom).offset(8)
        }
        
        firstContentImageView.snp.makeConstraints { make in
            make.top.equalTo(nowHotContentLabel.snp.bottom).offset(8)
            make.width.equalTo(view.snp.width).multipliedBy(0.3)
            make.leading.equalTo(mainImageView.snp.leading)
            make.height.equalTo(firstContentImageView.snp.width).multipliedBy(1.5)
        }
        
        secondContentImageView.snp.makeConstraints { make in
            make.size.verticalEdges.equalTo(firstContentImageView)
            make.leading.equalTo(firstContentImageView.snp.trailing).offset(6)
        }
        
        thirdContentImageView.snp.makeConstraints { make in
            make.size.verticalEdges.equalTo(firstContentImageView)
            make.leading.equalTo(secondContentImageView.snp.trailing).offset(6)
        }
        
        
        
    }
    
}
