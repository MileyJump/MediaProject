//
//  TabBarController.swift
//  MediaProject
//
//  Created by 최민경 on 6/24/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    func configureTabBar() {
        
        let firstVC = ViewController()
        let trendVC = TrendViewController()
        let movie = MovieCollectionViewController()
        let nasa = NasaViewController()
//        let recommend = RecommendViewController()


        // 네비게이션 컨트롤러 설정
        let firstvc = UINavigationController(rootViewController: firstVC)
        let trendvc = UINavigationController(rootViewController: trendVC)
        let movievc = UINavigationController(rootViewController: movie)
        let nasaVC = UINavigationController(rootViewController: nasa)
//        let recommendVC = UINavigationController(rootViewController: recommend)
        
        
        
        firstvc.tabBarItem = UITabBarItem(title: "영화", image: UIImage(systemName: "person"), tag: 0)
        firstvc.tabBarItem.selectedImage = UIImage(systemName: "popcorn.fill")
        
        trendVC.tabBarItem = UITabBarItem(title: "트렌드", image: UIImage(systemName: "chart.bar"), tag: 1)
        trendVC.tabBarItem.selectedImage = UIImage(systemName: "chart.bar.fill")
        
        movie.tabBarItem = UITabBarItem(title: "영화 검색", image: UIImage(systemName: "magnifyingglass.circle"), tag: 2)
        movie.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
        
        nasaVC.tabBarItem = UITabBarItem(title: "나사", image: UIImage(systemName: "magnifyingglass.circle"), tag: 2)
        
//        recommendVC.tabBarItem = UITabBarItem(title: "추천 영화", image: UIImage(systemName: "movieclapper"), tag: 3)
//        recommendVC.tabBarItem.selectedImage = UIImage(systemName: "movieclapper.fill")
        
        setViewControllers([firstvc,trendvc,movievc, nasaVC], animated: true)
         
    }
}
