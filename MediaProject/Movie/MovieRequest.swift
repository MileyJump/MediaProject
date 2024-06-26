//
//  MovieRequest.swift
//  MediaProject
//
//  Created by 최민경 on 6/26/24.
//

import Foundation
import Alamofire


enum MovieRequest {
    
    case similarMovies(id: Int)
    case recommendeMovies(id: Int)
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/movie/"
    }
    
    var endPoint: URL {
        switch self {
        case .similarMovies(let id):
            return URL(string: baseURL + "\(id)/similar?")!
        case .recommendeMovies(let id):
            return URL(string: baseURL + "\(id)/recommendations?")!
        }
    }
    
    var header: HTTPHeaders  {
        return ["Authorization" : APIKey.similarKey]
    }
    
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameter: Parameters {
        switch self {
        case .similarMovies, .recommendeMovies:
            return ["language" : "ko-KR"]
        }
        
    }
}
