//
//  TrendViewController.swift
//  MediaProject
//
//  Created by 최민경 on 6/10/24.
//

import UIKit
import SnapKit

class TrendViewController: UIViewController {
    
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
    
}

extension TrendViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendTableViewCell.identifier, for: indexPath) as! TrendTableViewCell
        
        return cell
    }
    
    
}
