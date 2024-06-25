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
    let poster_path: String
    //    let release_date: String
    let title: String
    //    let video: Bool
    //    let vote_average: Bool
    let vote_count: Int
}

struct Poster: Decodable {
    let backdrops: [Backdrops]
}

struct Backdrops: Decodable {
    let aspect_ratio: Double
    let height: Int
    //            "iso_639_1": null,
    let file_path: String
    let vote_average: Double
    let vote_count: Int
    let width: Int
}
