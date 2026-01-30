//
//  MoviePopularView.swift
//  MoviesViperSWUI
//
//  Created by Jose Preatorian on 30-01-26.
//

import SwiftUI
import SwiftUI

struct MoviePopularView: View {
    @ObservedObject var presenter: MoviePresenter
    
    var body: some View {
        NavigationView {
            Group {
                if presenter.isLoading {
                    ProgressView("Cargando películas...")
                } else {
                    List(presenter.filteredArticles, id: \.id) { article in
                        NavigationLink(destination: MovieDetailView(movie: article)) {
                            HStack(alignment: .top, spacing: 15) {
                                AsyncImage(url: URL(string: AppConfig.movieImageBaseURL + article.posterPath))  { phase in
                                    if let image = phase.image {
                                        image.resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 80, height: 120)
                                            .cornerRadius(8)
                                    } else if phase.error != nil {
                                        Color.gray.frame(width: 80, height: 120).cornerRadius(8)
                                    } else {
                                        ProgressView().frame(width: 80, height: 120)
                                    }
                                }

                                VStack(alignment: .leading, spacing: 5) {
                                    Text(article.title)
                                        .font(.headline)
                                        .lineLimit(2)
                                    Text("Language: \(article.originalLanguage.uppercased())")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text(article.releaseDate)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Populares")
            .searchable(text: $presenter.searchText, prompt: "Buscar película")
            .onAppear {
                presenter.getMovies()
            }
        }
    }
}
#Preview {
    let service = webServicesPopular()
    let interactor = MovieInteractor(service: service as! WebServicesPopularProtocol)
    let presenter = MoviePresenter()
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    return MoviePopularView(presenter: presenter)
}
