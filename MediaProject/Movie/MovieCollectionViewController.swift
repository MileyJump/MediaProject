//
//  MovieCollectionViewController.swift
//  MediaProject
//
//  Created by 최민경 on 6/11/24.
//

import UIKit
import Alamofire



class MovieCollectionViewController: UIViewController {
    
    var movieList: [Movie] = []
    var movieID:Int = 0
    var page = 1
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout() )
    
    static func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width - 40
        layout.itemSize = CGSize(width: width/3, height: width/2)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return layout
    }
    
    let searchBar = UISearchBar()
                                          
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.backgroundColor = .orange
        configureView()
        
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "영화 검색"
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        view.addSubview(collectionView)
        view.addSubview(searchBar)
         
        searchBar.delegate = self
        collectionView.prefetchDataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        
    }
    
    
    func callRequest(query: String) {
        
        let url =  "\(APIURL.movieURL)\(APIKey.movieKey)&query=\(query)&page=\(page)&language=ko-KR"
        
        let headers: HTTPHeaders = [
            "accept" : "application/json"
        ]
        
        AF.request(url, headers: headers).responseDecodable(of: MovieModel.self) { response in
            switch response.result {
            case .success(let value):
//                print(value)
                if self.page == 1 {
                    self.movieList = value.results
                    print("dddddd")
                } else {
                    self.movieList.append(contentsOf: value.results)
                    print("adfasdfasdfasdfdad")
                }
                self.collectionView.reloadData()
                
                if self.page == 1 {
                    self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
                        
                }

            case .failure(let error):
                print(error)
            }
        
            
            
        }
        
    }
    
}

extension MovieCollectionViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        print(#function)
        for item in indexPaths {
            if movieList.count - 2 == item.row {
                page += 1
                callRequest(query: searchBar.text!)
            }
        }
    }
    
    
}

extension MovieCollectionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        callRequest(query: searchBar.text!)
    }
}


extension MovieCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        cell.configureCell(data: movieList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        movieList[indexPath.row]
        let vc = RecommendViewController()
        vc.movieID = movieList[indexPath.row].id
        vc.movieTitle = movieList[indexPath.row].title
//        vc.movieID
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
