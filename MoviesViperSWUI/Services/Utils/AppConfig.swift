//
//  AppConfig.swift
//  MoviesViperSWUI
//
//  Created by Jose Preatorian on 30-01-26.
//

import Foundation

struct AppConfig {
    static let movieImageBaseURL = "https://image.tmdb.org/t/p/w200"
    
    static func movieImageUrl(for id: String) -> URL? {
        return URL(string: "\(String(describing: movieImageUrl))")
    }
}
