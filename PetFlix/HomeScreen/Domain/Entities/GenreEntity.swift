//
//  Genre.swift
//  PetFlix
//
//  Created by BS1098 on 20/5/24.
//

import Foundation

struct Genre: Identifiable {
    let id = UUID()
    let name: String
    let movies: [Movie]
}
