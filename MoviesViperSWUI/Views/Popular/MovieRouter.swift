//
//  MovieRouter.swift
//  MoviesViperSWUI
//
//  Created by Jose Preatorian on 30-01-26.
//

import Foundation
import SwiftUI
class MovieRouter {
    static func createModule() -> some View {
       
        let service = webServicesPopular()

        let interactor = MovieInteractor(service: service)

        let presenter = MoviePresenter()

        presenter.interactor = interactor
        interactor.presenter = presenter

        return MoviePopularView(presenter: presenter)
    }

}
