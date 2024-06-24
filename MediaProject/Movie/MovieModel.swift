//
//  MovieModel.swift
//  MediaProject
//
//  Created by 최민경 on 6/11/24.
//

import UIKit

struct MovieModel: Decodable {
    let page: Int
    let results: [Movie]
    
}

struct Movie: Decodable {
    let adult: Bool
    let backdrop_path: String?
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String?
    //    let popularity: Int
    let poster_path: String?
    //    let release_date: String
    let title: String
    //    let video: Bool
    //    let vote_average: Bool
    let vote_count: Int
}


struct RecommendModel {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}


//struct Results {
    
//    let adult: Bool
//    "backdrop_path": "/8yUobaGTcbRKerCkQF83kC6SYAq.jpg",
//    "genre_ids": [
//        35,
//        18,
//        10749
//    ],
//    "id": 244264,
//    "original_language": "en",
//    "original_title": "Laggies",
//    "overview": "친구들과의 트러블과 남자친구의 갑작스러운 프로포즈까지... 모든 것이 혼란스러워 숨고만 싶은 메간 앞에 자신의 어린 시절을 떠올리게 하는 16살의 소녀 아니카가 나타난다. 메간에게 친구같으면서도 엄마같은 사랑을 느끼는 아니카와 복잡한 상황을 탈출하고 싶은 메간은 함께 살기로 결정하고, 아버지와 단 둘이 살고있는 아니카의 집으로 옮긴다. 남자친구였던 안소니에게서는 느낄 수 없었던 편안한 동질감을 아니카의 아빠 크레이그에게 느끼게 되면서 메간은 진정으로 자신이 원하는 것이 무엇인지에 대해 고민하게 되는데...",
//    "popularity": 12.964,
//    "poster_path": "/kL2ccASO8O6v92gGTaaY5gOCAI4.jpg",
//    "release_date": "2014-09-25",
//    "title": "래기스",
//    "video": false,
//    "vote_average": 6.117,
//    "vote_count": 1105
//},
//}

