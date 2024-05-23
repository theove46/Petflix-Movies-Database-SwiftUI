//
//  HomeViewModel.swift
//  PetFlix
//
//  Created by BS1098 on 20/5/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var genres: [Genre] = []
    @Published var popularMovies: [Movie] = []
    
    private var homeRepository: HomeRepository
    private var cancellables = Set<AnyCancellable>()
    
    init(homeRepository: HomeRepository) {
        self.homeRepository = homeRepository
        fetchGenres()
        fetchPopularMovies()
    }
    
    func fetchGenres() {
        homeRepository.fetchGenres { [weak self] genres in
            DispatchQueue.main.async {
                self?.genres = genres
            }
        }
    }
    
    func fetchPopularMovies() {
        homeRepository.fetchPopularMovies { [weak self] movie in
            DispatchQueue.main.async {
                self?.popularMovies = movie
            }
        }
    }
}
