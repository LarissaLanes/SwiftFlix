//
//  MoviesModel.swift
//  SwiftFlix
//
//  Created by Larissa de Souza Lanes Goncalves on 13/10/22.
//

import Foundation

struct MovieInfo: Codable {
    let page: Int
    let total_pages: Int
    let total_results: Int
    let results: [MoviesData]
}

struct MoviesData: Codable {
    let adult: Bool
    let backdrop_path: String
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}
