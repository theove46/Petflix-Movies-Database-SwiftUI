//
//  MovieDetailsView.swift
//  PetFlix
//
//  Created by BS1098 on 20/5/24.
//

import SwiftUI

struct MovieDetailsScreen: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: movie.posterURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 300)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            
                    @unknown default:
                        EmptyView()
                    }
                }
                
                Text(movie.title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom)
                    .padding(.horizontal, 16)
                
                Text("\(movie.releaseYearString) | \(movie.pg) | \(movie.runtimeString)")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.bottom)
                
                Text("Ratings: \(movie.ratings, specifier: "%.1f")/10")
                    .font(.callout)
                    .foregroundColor(.yellow)
                    .padding(.horizontal, 16)
                    .padding(.bottom)
                
                Text(movie.details)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.bottom)
            }
        }
        .background(gradientBackgroud)
    }
        
}

struct MovieDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        return MovieDetailsScreen(movie: sampleMovie)
    }
}


