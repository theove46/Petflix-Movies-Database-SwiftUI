//
//  HomeRepositoriesImpl.swift
//  PetFlix
//
//  Created by BS1098 on 20/5/24.
//

import Foundation

class HomeRepositoryImpl: HomeRepository {
    private let homeDataSource: HomeLocalDataSource
    
    init(homeDataSource: HomeLocalDataSource) {
        self.homeDataSource = homeDataSource
    }
    
    func fetchGenres(completion: @escaping ([Genre]) -> Void) {
        let genres = homeDataSource.getGenres()
        completion(genres)
    }
    
    func fetchPopularMovies(completion: @escaping ([Movie]) -> Void) {
        let popularMovies = homeDataSource.getPopular()
        completion(popularMovies)
    }
}
