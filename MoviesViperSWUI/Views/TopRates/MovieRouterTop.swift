//
//  MovieRouterTop.swift
//  MoviesViperSWUI
//
//  Created by Jose Preatorian on 30-01-26.
//

import Foundation
import SwiftUI
class MovieRouterTop {
    
    static func createModuleTop() -> some View {
       
        let service = webServicesTopRates()

        let interactor = MovieInteractorTop(service: service)

        let presenter = MoviePresenterTop()

        presenter.interactor = interactor
        interactor.presenter = presenter

        return MovieTopRatesView(presenter: presenter)
    }
}
