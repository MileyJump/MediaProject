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
    
    var isExpanded = false
    
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
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .darkGray.withAlphaComponent(0.7)
        return label
    }()
    
    let overViewLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray.withAlphaComponent(0.15)
        return view
    }()
    
    let overViewTableView = UITableView()
    
    let castLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .darkGray.withAlphaComponent(0.7)
        label.text = "Cast"
        return label
    }()
    
    let castLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray.withAlphaComponent(0.15)
        return view
    }()
    
    let castTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureHierarchy()
        configureLayout()
        configureTableView()
        callRequest()
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
        overViewTableView.backgroundColor = .blue
        overViewTableView.estimatedRowHeight = 100 // 추정 높이
        overViewTableView.rowHeight = UITableView.automaticDimension // 자동 높이
        
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
        view.addSubview(overViewLineView)
        view.addSubview(overViewTableView)
        view.addSubview(castLabel)
        view.addSubview(castLineView)
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
        
        overViewLineView.snp.makeConstraints { make in
            make.top.equalTo(overViewLabel.snp.bottom).offset(4)
            make.height.equalTo(1)
            make.leading.equalTo(overViewLabel.snp.leading).inset(-5)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        overViewTableView.snp.makeConstraints { make in
            make.top.equalTo(overViewLineView.snp.bottom)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.snp.height).multipliedBy(0.15)
        }
        
        castLabel.snp.makeConstraints { make in
            make.top.equalTo(overViewTableView.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        castLineView.snp.makeConstraints { make in
            make.top.equalTo(castLabel.snp.bottom).offset(4)
            make.height.equalTo(1)
            make.leading.equalTo(overViewLabel.snp.leading).inset(-5)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            
        }
        
        castTableView.snp.makeConstraints { make in
            make.top.equalTo(castLineView.snp.bottom).offset(4)
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
            
            overCell.configureCell(data: trendData, isExpanded: isExpanded)
            return overCell
        } else {
            let caseCell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.identifier, for: indexPath) as! CastTableViewCell
            caseCell.configureCell(data: creditData[indexPath.row])
            
            return caseCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == overViewTableView {
            print(#function)
            if tableView == overViewTableView {
                
                isExpanded.toggle()
                tableView.reloadRows(at: [indexPath], with: .automatic)
                
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isExpanded {
               return 200 // 확장될 높이
           } else {
               return 100 // 축소될 높이
           }
    }
}

