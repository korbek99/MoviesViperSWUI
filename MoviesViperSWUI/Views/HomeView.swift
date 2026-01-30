//
//  HomeView.swift
//  MoviesViperSWUI
//
//  Created by Jose Preatorian on 30-01-26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
                  
            MoviePopularView()
                .tabItem {
                    Label("Popular", systemImage: "popcorn.fill")
                }

    
            MovieTopRatesView()
                .tabItem {
                    Label("Top Rated", systemImage: "star.fill")
                }


            ProfileView()
                .tabItem {
                    Label("Info", systemImage: "info.circle.fill")
                }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            Text("Configuración de Perfil")
                .navigationTitle("Perfil")
        }
    }
}

#Preview {
    HomeView()
}

