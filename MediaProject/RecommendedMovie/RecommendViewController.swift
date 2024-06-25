//
//  RecommendViewController.swift
//  MediaProject
//
//  Created by 최민경 on 6/24/24.
//

import UIKit
import Alamofire
import SnapKit

class RecommendViewController: UIViewController {
    
    var movie: [Movie] = []
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.text = "극한직업"
        textField.textColor = .white
        textField.backgroundColor = .white
        return textField
    }()
    
    let similarLabel: UILabel = {
        let label = UILabel()
        label.configureLabel(text: "비슷한 영화", font: 16, color: .white)
        return label
    }()
    
    let similarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout() )
    let recommendedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout() )
    let posterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout() )
    
    static func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let itemSpacing:CGFloat = 5
        let width = UIScreen.main.bounds.width
        let itemWidt = (width) - (itemSpacing * 4)
        layout.itemSize = CGSize(width: itemWidt/3, height: itemWidt/2.5)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = itemSpacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        return layout
    }
    
    let recommendedLabel: UILabel = {
        let label = UILabel()
        label.configureLabel(text: "비슷한 영화", font: 16, color: .white)
        return label
    }()
    
    let posterLabel: UILabel = {
        let label = UILabel()
        label.configureLabel(text: "비슷한 영화", font: 16, color: .white)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureHierachy()
        configureLayout()
        callRequest()
    }
    
    func callRequest() {
        let url = "\(APIURL.similarURL)64/similar?language=ko-kr"
        let header:HTTPHeaders = [
            "accept" : "application/json",
            "Authorization" : APIKey.similarKey
        ]
        
        AF.request(url, headers: header).responseDecodable(of: MovieModel.self) { response in
            switch response.result {
            case .success(let value):
                print(value)
                self.movie = value.results
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func configureView() {
        view.backgroundColor = .black
        
        let menu = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(menuButtonClicked))
        navigationItem.rightBarButtonItem = menu
        
        similarCollectionView.backgroundColor = .white
        similarCollectionView.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
        similarCollectionView.dataSource = self
        similarCollectionView.delegate = self
    }
    
    @objc func menuButtonClicked() {
        
    }
    
}

extension RecommendViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as! RecommendCollectionViewCell
        // 셀 구성
        return cell
    }
}


extension RecommendViewController {
    
    func configureHierachy() {
        view.addSubview(titleTextField)
        view.addSubview(similarLabel)
        view.addSubview(similarCollectionView)
        view.addSubview(recommendedLabel)
        view.addSubview(recommendedCollectionView)
        view.addSubview(posterLabel)
        view.addSubview(posterCollectionView)
    }
    
    func configureLayout() {
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.size.equalTo(40)
        }
        
        similarLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(10)
            make.leading.equalTo(titleTextField)
        }
        
        similarCollectionView.snp.makeConstraints { make in
            make.top.equalTo(similarLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(150)
        }
        
        recommendedLabel.snp.makeConstraints { make in
            make.top.equalTo(similarCollectionView.snp.bottom).offset(10)
            make.leading.equalTo(titleTextField)
        }
        
        recommendedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(recommendedLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(150)
        }
        
        posterLabel.snp.makeConstraints { make in
            make.top.equalTo(recommendedCollectionView.snp.bottom).offset(10)
            make.leading.equalTo(titleTextField)
        }
        
        posterCollectionView.snp.makeConstraints { make in
            make.top.equalTo(posterLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(150)
        }
        
        
        
    }
}
