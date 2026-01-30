//
//  MovieDetailView.swift
//  MoviesViperSWUI
//
//  Created by Jose Preatorian on 30-01-26.
//

import SwiftUI
import SwiftUI

struct MovieDetailView: View {
    let movie: Result
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
       
                        MovieImage(path: movie.posterPath, width: 250, height: 375)
 
                        MovieImage(path: movie.backdropPath, width: 330, height: 200)
                    }
                    .padding(.horizontal)
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(movie.title)
                        .font(.title.bold())
                    
                    HStack {
                        Label("\(String(format: "%.1f", movie.voteAverage))", systemImage: "star.fill")
                            .foregroundColor(.orange)
                        
                        Text("•")
                        
                        Text(movie.releaseDate)
                        
                        Text("•")
                        
                        Text(movie.originalLanguage.uppercased())
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("Sinopsis")
                        .font(.headline)
                    
                    Text(movie.overview)
                        .font(.body)
                        .lineSpacing(5)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MovieImage: View {
    let path: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: AppConfig.movieImageBaseURL + path)) { phase in
            switch phase {
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                    .cornerRadius(12)
            case .failure:
                Color.gray.frame(width: width, height: height).cornerRadius(12)
            default:
                ProgressView().frame(width: width, height: height)
            }
        }
    }
}

#Preview {
 
    let sampleMovie = Result(
        adult: false,
        backdropPath: "/o7m2pA9YtdC6pSdidqZODuCcNoH.jpg",
        genreIDS: [28, 878],
        id: 1,
        originalLanguage: "en",
        originalTitle: "Sample Movie",
        overview: "Esta es una descripción de prueba para ver cómo luce el detalle en VIPER con SwiftUI.",
        popularity: 8.5,
        posterPath: "/1E5baAaEse26fej7uHcjS3KyUjZ.jpg",
        releaseDate: "2024-05-20",
        title: "Película de Prueba",
        video: false,
        voteAverage: 7.5,
        voteCount: 100
    )
    
    return NavigationView {
        MovieDetailView(movie: sampleMovie)
    }
}

