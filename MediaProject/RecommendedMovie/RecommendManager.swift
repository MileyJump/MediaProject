//
//  RecommendManager.swift
//  MediaProject
//
//  Created by 최민경 on 6/25/24.
//

import UIKit
import Alamofire

struct RecommendManager {
    
    static let shared = RecommendManager()
    
    private init() { }
    
    func similarMovies(id: Int, completionHandler: @escaping ([Movie]) -> Void ) {
        let url = "\(APIURL.similarURL)\(id)/similar?language=ko-kr"
        let header:HTTPHeaders = [
            "Authorization" : APIKey.similarKey
        ]
        
        AF.request(url, headers: header).responseDecodable(of: MovieModel.self) { response in
            switch response.result {
            case .success(let value):
                completionHandler(value.results)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func recommendedMovies(id: Int, completionHandler: @escaping ([Movie]) -> Void ) {
        let url = "\(APIURL.recommendURL)\(id)/recommendations?language=ko-KR"
        let header:HTTPHeaders = [
            "Authorization" : APIKey.similarKey
        ]
        
        AF.request(url, headers: header).responseDecodable(of: MovieModel.self) { response in
            switch response.result {
            case .success(let value):
                //                print(value)
                completionHandler(value.results)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func posterMovies(id: Int, completionHandler: @escaping ([Backdrops]) -> Void ) {
        let url = "\(APIURL.posterUIL)\(id)/images"
        let header:HTTPHeaders = [
            "Authorization" : APIKey.similarKey
        ]
        
        AF.request(url, headers: header).responseDecodable(of: Poster.self) { response in
            switch response.result {
            case .success(let value):
                //                print(value)
                completionHandler(value.backdrops)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}



