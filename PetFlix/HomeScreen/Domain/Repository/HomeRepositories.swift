//
//  HomeRepositories.swift
//  PetFlix
//
//  Created by BS1098 on 20/5/24.
//

import Foundation

protocol HomeRepository {
    func fetchGenres(completion: @escaping ([Genre]) -> Void)
    func fetchPopularMovies(completion: @escaping ([Movie]) -> Void)
}
