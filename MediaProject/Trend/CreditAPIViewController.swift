//
//  CreditAPIViewController.swift
//  MediaProject
//
//  Created by 최민경 on 6/12/24.
//

import UIKit

class CreditAPIViewController: UIViewController {
    
    var trendData: [Results] = []
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Squid Game"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let overViewLabel: UILabel = {
        let label = UILabel()
        label.text = "OverView"
        return label
    }()
    
    let overViewTableView = UITableView()
    
    let castLabel: UILabel = {
        let label = UILabel()
        label.text = "Cast"
        return label
    }()
    
    let castTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureHierarchy()
        configureLayout()
        configureTableView()
        
        overViewTableView.backgroundColor = .red
        castTableView.backgroundColor = .brown
        
    }
    
    func configureTableView() {
        overViewTableView.register(OverViewTableViewCell.self, forCellReuseIdentifier: OverViewTableViewCell.identifier)
        castTableView.register(CastTableViewCell.self, forCellReuseIdentifier: CastTableViewCell.identifier)
        
        overViewTableView.delegate = self
        overViewTableView.dataSource = self
        
        castTableView.delegate = self
        castTableView.dataSource = self
    }
    
    func configureView() {
        view.backgroundColor = .white
        navigationItem.title = "출연/제작"
        navigationController?.navigationBar.tintColor = .black
    }
    
    func configureHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(posterImageView)
        view.addSubview(overViewLabel)
        view.addSubview(overViewTableView)
        view.addSubview(castLabel)
        view.addSubview(castTableView)
    }
    
    func configureLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.snp.height).multipliedBy(0.25)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(backgroundImageView.snp.leading).inset(20)
            make.top.equalTo(backgroundImageView.snp.top).inset(20)
        }
        posterImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel.snp.leading)
            make.bottom.equalTo(backgroundImageView.snp.bottom).inset(6)
            make.width.equalTo(posterImageView.snp.height).multipliedBy(0.75)
        }
        
        overViewLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.bottom).offset(20)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        overViewTableView.snp.makeConstraints { make in
            make.top.equalTo(overViewLabel.snp.bottom)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.snp.height).multipliedBy(0.15)
        }
        
        castLabel.snp.makeConstraints { make in
            make.top.equalTo(overViewTableView.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        castTableView.snp.makeConstraints { make in
            make.top.equalTo(castLabel.snp.bottom).offset(4)
            make.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension CreditAPIViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == overViewTableView {
            return 1
        } else {
            return trendData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == overViewTableView {
            let overCell = tableView.dequeueReusableCell(withIdentifier: OverViewTableViewCell.identifier, for: indexPath) as! OverViewTableViewCell
            print("========")
            overCell.configureCell(data: trendData[indexPath.row])
            return overCell
        } else {
            let caseCell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.identifier, for: indexPath) as! CastTableViewCell
            return caseCell
        }
    }
    
    
}

