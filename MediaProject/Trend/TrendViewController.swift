//
//  TrendViewController.swift
//  MediaProject
//
//  Created by 최민경 on 6/10/24.
//

import UIKit
import Alamofire
import SnapKit

class TrendViewController: UIViewController {
    
    var trendData: [Results] = []
    
    let trendTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        configureView()
        configureNavigationBar()
        configureTableView()
        configureHierarchy()
        configureLayout()
        callRequest()
    }
    
    func configureTableView() {
        trendTableView.delegate = self
        trendTableView.dataSource = self
        trendTableView.register(TrendTableViewCell.self, forCellReuseIdentifier: TrendTableViewCell.identifier)
    }
    
    func configureView() {
        view.backgroundColor = .white
        
    }
    
    func configureNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .lightGray
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.backButtonTitle = ""
        
        let menu = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(listButtonTapped))
        let search = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonTapped))
        
        navigationItem.leftBarButtonItem = menu
        navigationItem.rightBarButtonItem = search
    }
    

    @objc func listButtonTapped() {
        print(#function)
    }
    
    
    @objc func searchButtonTapped() {
        print(#function)
    }
    
    func configureHierarchy() {
        view.addSubview(trendTableView)
    }
    
    func configureLayout() {
        trendTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func callRequest() {
        
        let headers: HTTPHeaders = [
            "accept": "application/json",
            "Authorization":  "Bearer \(APIKey.trendKey)"
        ]
  
        
        AF.request(APIURL.trendURL, method: .get, headers: headers)
            .responseDecodable(of: Trend.self) { response in
            switch response.result{
            case .success(let value):
//                print(value)
                self.trendData = value.results
                print(value.results[0].id)
                self.trendTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension TrendViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trendData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendTableViewCell.identifier, for: indexPath) as! TrendTableViewCell
        cell.configureCell(data: trendData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        
        let creditAPIVC = CreditAPIViewController()
        creditAPIVC.trendData = trendData
        navigationController?.pushViewController(creditAPIVC, animated: true)
    }
    
    
}
