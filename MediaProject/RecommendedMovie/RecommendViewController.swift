//
//  RecommendViewController.swift
//  MediaProject
//
//  Created by 최민경 on 6/24/24.
//

import UIKit
import Alamofire
import SnapKit
import Kingfisher

enum MovieOptions : String, CaseIterable {
    case Similar = "비슷한 영화"
    case recommend = "추천 영화"
    case poster = "포스터"
}

class RecommendViewController: UIViewController {
    
    var movie: [[Movie]] = [[],[]]
    var poster: [Backdrops] = []
    
    var movieID: Int = 64
    var movieTitle: String = ""
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "극한직업"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        //        label.backgroundColor = .white
        return label
    }()
    
    lazy var tableView = {
        let view = UITableView()
        view.backgroundColor = .black
        view.delegate = self
        view.dataSource = self
        view.rowHeight = 200
        view.register(RecommendTableViewCell.self, forCellReuseIdentifier: RecommendTableViewCell.identifier)
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureHierachy()
        configureLayout()
        
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.global().async {
            MovieManager.shared.moviesService(api: .similarMovies(id: self.movieID)) { movie, error in
                print("되고 있나요")
                if let error = error {
                    print(error)
                } else {
                    guard let movie = movie else { return }
                    self.movie[0] = movie
                }
                group.leave()
            }
        }
        
        group.enter()
        DispatchQueue.global().async(group: group) {
            MovieManager.shared.moviesService(api: .recommendeMovies(id: self.movieID)) { movie, error in
                if let error = error {
                    print(error)
                } else {
                    guard let movie = movie else { return }
                    self.movie[1] = movie
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.tableView.reloadData()
        }   
    }
    
    
    
    func configureView() {
        view.backgroundColor = .black
        
        let menu = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(menuButtonClicked))
        navigationItem.rightBarButtonItem = menu
        titleLabel.text = movieTitle
    }
    
    
    @objc func menuButtonClicked() {
        print(#function)
    }
    
}


extension RecommendViewController {
    
    func configureHierachy() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension RecommendViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecommendTableViewCell.identifier, for: indexPath) as! RecommendTableViewCell
        let movieOptions = MovieOptions.allCases[indexPath.row]
        
        cell.titleLabel.text = movieOptions.rawValue
        cell.collectionView.dataSource = self
        cell.collectionView.delegate = self
        cell.collectionView.tag = indexPath.row
        cell.collectionView.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
        cell.collectionView.reloadData()
        return cell
    }
}

extension RecommendViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as! RecommendCollectionViewCell
        let data = movie[collectionView.tag][indexPath.item]
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(data.poster_path)")
        cell.posterImageView.kf.setImage(with: url)
        return cell
    }
    
    
}
