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
                
                
                // Poster
                AsyncImage(url: movie.posterURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: .infinity, height: 250)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: .infinity, height: 250)
                            .cornerRadius(10)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: .infinity, height: 250)
                            .cornerRadius(10)
                    @unknown default:
                        EmptyView()
                    }
                    
                }
                
                VStack(alignment: .leading) {
                    Text("Action | Super Hero | Thriller")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                    
                    Text(movie.title)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    HStack {
                        roundedInfoBox(text: movie.releaseYearString)
                        roundedInfoBox(text: movie.pg)
                        roundedInfoBox(text: movie.runtimeString)
                    }
                    .padding(.horizontal, 16)
                    
                    Text(movie.details)
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.bottom)
                    
                    Button(action: {
                    }) {
                        Text("Add to Watchlist")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 12)
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 16)
                    
                    HStack{
                        Spacer()
                        VStack {
                            Text("Overall Rating")
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("\(movie.ratings, specifier: "%.1f")")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            HStack(spacing: 2) {
                                ForEach(0..<5) { index in
                                    star(for: movie.ratings, at: index)
                                }
                            }
                            
                        }
                        
                        Spacer()
                        
                        Divider()
                            .frame(height: 100)
                            .frame(width: 1)
                            .foregroundColor(.white)
                            .background(.white)
                        
                        Spacer()
                        
                        VStack {
                            Text("Your Rating")
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("\(movie.yourRating ?? 0.0, specifier: "%.1f")")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            HStack(spacing: 2) {
                                ForEach(0..<5) { index in
                                    star(for: movie.yourRating ?? 0.0, at: index)
                                }
                            }
                            
                        }
                        Spacer()
                        
                    }
                    
                }
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


