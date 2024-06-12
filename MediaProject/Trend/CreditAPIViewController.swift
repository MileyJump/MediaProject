//
//  CreditAPIViewController.swift
//  MediaProject
//
//  Created by 최민경 on 6/12/24.
//

import UIKit
import Alamofire

class CreditAPIViewController: UIViewController {
    
    var trendData: Results?
    var movieID: Int?
    var creditData: [Cast] = []
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Squid Game"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 25)
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
        callRequest()
        
        overViewTableView.backgroundColor = .red
        castTableView.backgroundColor = .brown
    }
    

    
    func callRequest() {
        guard let movieID = movieID else { return }
        let url = "https://api.themoviedb.org/3/movie/\(movieID)/credits?\(APIKey.movieKey)"
        print(url)
        
        AF.request(url).responseDecodable(of: Credit.self) { response in
            switch response.result {
            case .success(let value):
                print(value)
                self.creditData = value.cast
                self.castTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
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
        
        guard let trendData = trendData else { return }
        
        let backdropImageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(trendData.backdrop_path))")
        backgroundImageView.kf.setImage(with: backdropImageURL)
        let posterIamgeUIRL = URL(string: "https://image.tmdb.org/t/p/w500/\(trendData.poster_path))")
        posterImageView.kf.setImage(with: posterIamgeUIRL)
        titleLabel.text = trendData.title
        
        
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
            make.height.equalTo(30)
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
            return creditData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let trendData = trendData else {
            fatalError("trendData is nil")
        }
        
        if tableView == overViewTableView {
            let overCell = tableView.dequeueReusableCell(withIdentifier: OverViewTableViewCell.identifier, for: indexPath) as! OverViewTableViewCell
            overCell.configureCell(data: trendData)
            return overCell
        } else {
            let caseCell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.identifier, for: indexPath) as! CastTableViewCell
            caseCell.configureCell(data: creditData[indexPath.row])
            
            return caseCell
        }
    }
    
    
}

