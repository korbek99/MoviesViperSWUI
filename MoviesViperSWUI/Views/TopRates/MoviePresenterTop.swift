//
//  MoviePresenterTop.swift
//  MoviesViperSWUI
//
//  Created by Jose Preatorian on 30-01-26.
//

import Foundation
class MoviePresenterTop: ObservableObject, MovieInteractorTopOutputProtocol {
    @Published var articles: [Result] = []
    @Published var isLoading = false
    @Published var searchText = ""
    
    var interactor: MovieInteractorTopInputProtocol?

    var filteredArticles: [Result] {
        if searchText.isEmpty {
            return articles
        } else {
            return articles.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func getMovies() {
        isLoading = true
        interactor?.fetchMovies()
    }
    
    func didFetchMovies(_ movies: [Result]?) {
        DispatchQueue.main.async {
            self.isLoading = false
            if let movies = movies {
                self.articles = movies
            }
        }
    }
}
