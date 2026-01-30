//
//  MovieInteractor.swift
//  MoviesViperSWUI
//
//  Created by Jose Preatorian on 30-01-26.
//

import Foundation
protocol MovieInteractorInputProtocol {
    func fetchMovies()
}

protocol MovieInteractorOutputProtocol: AnyObject {
    func didFetchMovies(_ movies: [Result]?)
}

class MovieInteractor: MovieInteractorInputProtocol {
    private let service: WebServicesPopularProtocol
    weak var presenter: MovieInteractorOutputProtocol?
    
    init(service: WebServicesPopularProtocol) {
        self.service = service
    }
    
    func fetchMovies() {
        service.getArticles { [weak self] movies in
            self?.presenter?.didFetchMovies(movies)
        }
    }
}
