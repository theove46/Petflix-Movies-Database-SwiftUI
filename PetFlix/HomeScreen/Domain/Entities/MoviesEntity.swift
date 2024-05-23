//
//  Movies.swift
//  PetFlix
//
//  Created by BS1098 on 20/5/24.
//

import Foundation

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let details: String
    let posterURL: URL
    let ratings: Double
    let yourRating: Double?
    let pg: String
    let releaseYear: Date
    let runTime: Double
    
    var releaseYearString: String {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year], from: releaseYear)
            return String(components.year ?? 0)
        }
        
        var runtimeString: String {
            let hours = Int(runTime) / 3600
            let minutes = (Int(runTime) % 3600) / 60
            return "\(hours)h \(minutes)m"
        }
}
