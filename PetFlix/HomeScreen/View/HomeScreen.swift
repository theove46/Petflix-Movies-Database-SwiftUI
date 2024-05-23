//
//  ContentView.swift
//  PetFlix
//
//  Created by BS1098 on 20/5/24.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var viewModel: HomeViewModel
    @State private var currentPage = 0
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    // Welcome Text
                    Text("Welcome back, ")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                        .frame(height: 5)
                    
                    Text("The OveMania")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    
                    
                    // Popular movies slider
                    ZStack(alignment: .bottomTrailing) {
                        TabView(selection: $currentPage) {
                            ForEach(viewModel.popularMovies.indices, id: \.self) { index in
                                let movie = viewModel.popularMovies[index]
                                NavigationLink(destination: MovieDetailsScreen(movie: movie)) {
                                    GeometryReader { geometry in
                                        
                                        ZStack(alignment: .topLeading) {
                                            
                                            // Poster
                                            AsyncImage(url: movie.posterURL) { phase in
                                                switch phase {
                                                case .empty:
                                                    ProgressView()
                                                        .frame(width: geometry.size.width, height: 250)
                                                case .success(let image):
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: geometry.size.width, height: 250)
                                                        .cornerRadius(10)
                                                case .failure:
                                                    Image(systemName: "photo")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: geometry.size.width, height: 250)
                                                        .cornerRadius(10)
                                                @unknown default:
                                                    EmptyView()
                                                }
                                            }
                                            
                                            // Ratings
                                            VStack(alignment: .leading, spacing: 4) {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundColor(Color.white.opacity(0.5))
                                                    .frame(width: 50, height: 30)
                                                    .clipShape(
                                                        RoundedRectangle(cornerRadius: 10)
                                                    )
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(.white, lineWidth: 1)
                                                    )
                                                    .overlay(
                                                        HStack(spacing: 4) {
                                                            Image(systemName: "star.fill")
                                                                .foregroundColor(.white)
                                                                .font(.system(size: 12))
                                                            Text("\(movie.ratings, specifier: "%.1f")")
                                                                .foregroundColor(.white)
                                                                .font(.system(size: 12))
                                                        }
                                                    )
                                                    .padding(.top, 10)
                                                    .padding(.leading, 10)
                                            }
                                            
                                            // Descriptions
                                            VStack {
                                                Spacer()
                                                HStack {
                                                    VStack(alignment: .leading, spacing: 4) {
                                                        Text(movie.title)
                                                            .font(.title3)
                                                            .lineLimit(1)
                                                            .foregroundColor(.white)
                                                        
                                                        Text("History Thriller Drama Mystery")
                                                            .font(.caption)
                                                            .foregroundColor(.white)
                                                        
                                                        HStack {
                                                            roundedInfoBox(text: movie.releaseYearString)
                                                            roundedInfoBox(text: movie.pg)
                                                            roundedInfoBox(text: movie.runtimeString)
                                                        }
                                                        
                                                    }
                                                    .padding(.leading, 16)
                                                    
                                                    Spacer()
                                                    
                                                    // Wishlist Button
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        Button(action: {
                                                        }) {
                                                            Text("Add to wishlist")
                                                                .font(.system(size: 12))
                                                                .foregroundColor(.white)
                                                                .padding(.vertical, 12)
                                                                .padding(.horizontal, 12)
                                                                .background(Color.purple)
                                                                .cornerRadius(10)
                                                            
                                                        }
                                                        .padding(.trailing, 16)
                                                        
                                                
                                                    }
                                                }
                                                .padding(.vertical, 16)
                                                //                                            .background(
                                                //                                                VisualEffectBlur(effect: .systemMaterial) {
                                                //
                                                //                                                    Rectangle()
                                                //                                                        .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                                                //                                                        .edgesIgnoringSafeArea(.all)
                                                //
                                                //                                                        .foregroundColor(Color.white.opacity(0.2))
                                                //                                                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color.white), alignment: .top)
                                                //                                                }
                                                //                                            )
                                                .background(
                                                    Rectangle()
                                                        .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                                                        .edgesIgnoringSafeArea(.all)
                                                    
                                                        .foregroundColor(Color.white.opacity(0.2))
                                                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color.white), alignment: .top)
                                                    
                                                    
                                                    
                                                )
                                                
                                                
                                                
                                            }
                                            
                                        }
                                        .frame(width: geometry.size.width, height: 250)
                                        
                                    }
                                    .frame(width: UIScreen.main.bounds.width - 32)
                                }
                                .tag(index)
                                
                            }
                            
                            
                            
                            
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .frame(height: 250)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 10)
                        .onChange(of: currentPage) { oldValue, newValue in
                            print("Page changed from \(oldValue) to \(newValue)")
                        }
                        
                        // Slider Indicator
                        HStack(spacing: 4) {
                            ForEach(0..<viewModel.popularMovies.count, id: \.self) { index in
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: index == currentPage ? 16 : 4, height: 4)
                                    .cornerRadius(2)
                                    .onTapGesture {
                                        currentPage = index
                                    }
                            }
                        }
                        .padding(.trailing, 80)
                        .padding(.bottom, 20)
                    }
                    Spacer()
                    
                    Spacer()
                        .frame(height: 10)
                    
                    // Genres
                    VStack(alignment: .leading) {
                        ForEach(viewModel.genres) { genre in
                            VStack(alignment: .leading) {
                                Text(genre.name)
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.leading, 16)
                                
                                Spacer()
                                    .frame(height: 10)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(alignment: .top) {
                                        ForEach(genre.movies) { movie in
                                            NavigationLink(destination: MovieDetailsScreen(movie: movie)) {
                                                VStack(alignment: .leading){
                                                    ZStack(alignment: .topLeading) {
                                                        
                                                        AsyncImage(url: movie.posterURL) { phase in
                                                            switch phase {
                                                            case .empty:
                                                                ProgressView()
                                                                    .frame(width: 150, height: 200)
                                                            case .success(let image):
                                                                image
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 150, height: 200)
                                                                    .cornerRadius(10)
                                                            case .failure:
                                                                Image(systemName: "photo")
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 150, height: 200)
                                                                    .cornerRadius(10)
                                                            @unknown default:
                                                                EmptyView()
                                                            }
                                                        }
                                                        
                                                        VStack(alignment: .leading, spacing: 4) {
                                                            RoundedRectangle(cornerRadius: 10)
                                                                .foregroundColor(Color.white.opacity(0.5))
                                                                .frame(width: 50, height: 30)
                                                                .clipShape(
                                                                    RoundedRectangle(cornerRadius: 10)
                                                                )
                                                                .overlay(
                                                                    RoundedRectangle(cornerRadius: 10)
                                                                        .stroke(.white, lineWidth: 1)
                                                                )
                                                                .overlay(
                                                                    HStack(spacing: 4) {
                                                                        Image(systemName: "star.fill")
                                                                            .foregroundColor(.white)
                                                                            .font(.system(size: 12))
                                                                        Text("\(movie.ratings, specifier: "%.1f")")
                                                                            .foregroundColor(.white)
                                                                            .font(.system(size: 12))
                                                                    }
                                                                )
                                                                .padding(.top, 10)
                                                                .padding(.leading, 10)
                                                        }
                                                    }
                                                    
                                                    Text(movie.title)
                                                        .font(.system(size: 16))
                                                        .foregroundColor(.white)
                                                        .frame(width: 150, alignment: .leading)
                                                        .lineLimit(1)
                                                    
                                                    let detailsText = "\(movie.releaseYearString) | \(movie.pg) | \(movie.runtimeString)"
                                                    
                                                    Text(detailsText)
                                                        .font(.system(size: 12))
                                                        .foregroundColor(.white)
                                                        .frame(width: 150, alignment: .leading)
                                                        .lineLimit(1)
                                                }
                                                .padding(.horizontal, 4)
                                            }
                                        }
                                    }
                                    .frame(height: 250)
                                }
                                .padding(.leading, 12)
                            }
                        }
                    }
                }
            }
            .background(gradientBackgroud)
        }
        .onAppear {
            viewModel.fetchPopularMovies()
            viewModel.fetchGenres()
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        let dataSource = HomeLocalDataSourceImpl()
        let repository = HomeRepositoryImpl(homeDataSource: dataSource)
        let viewModel = HomeViewModel(homeRepository: repository)
        HomeScreen(viewModel: viewModel)
    }
}


