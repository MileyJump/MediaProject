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
    
    typealias CompletionHandler = ([Movie]?, String?) -> Void
    
    func moviesService(api: MovieRequest, completionHandler: @escaping CompletionHandler) {
        AF.request(api.endPoint, method: api.method, parameters: api.parameter, encoding: URLEncoding(destination: .queryString), headers: api.header).validate(statusCode: 200..<500).responseDecodable(of: MovieModel.self) { response in
            switch response.result {
            case .success(let value):
//                print("SUCCESS")
//                dump(value)
                completionHandler(value.results, nil)
            case .failure(let error):
//                print("FAILED")
                completionHandler(nil, "잠시 후 다시 시도해주세요")
                print(error)
            }
        }
        
    }
}



