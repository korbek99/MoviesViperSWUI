//
//  MovieInteractorTop.swift
//  MoviesViperSWUI
//
//  Created by Jose Preatorian on 30-01-26.
//

import Foundation
protocol MovieInteractorTopInputProtocol {
    func fetchMovies()
}

protocol MovieInteractorTopOutputProtocol: AnyObject {
    func didFetchMovies(_ movies: [Result]?)
}

class MovieInteractorTop: MovieInteractorTopInputProtocol {
    private let service: webServicesTopRatesProtocol
    weak var presenter: MovieInteractorTopOutputProtocol?
    
    init(service: webServicesTopRatesProtocol) {
        self.service = service
    }
    
    func fetchMovies() {
        service.getArticles { [weak self] movies in
            self?.presenter?.didFetchMovies(movies)
        }
    }
}
