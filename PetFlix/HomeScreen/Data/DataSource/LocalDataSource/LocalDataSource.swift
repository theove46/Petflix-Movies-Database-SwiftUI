//
//  DummyModel.swift
//  PetFlix
//
//  Created by BS1098 on 20/5/24.
//

import Foundation

protocol HomeLocalDataSource {
    func getGenres() -> [Genre]
    func getPopular() -> [Movie]
}
