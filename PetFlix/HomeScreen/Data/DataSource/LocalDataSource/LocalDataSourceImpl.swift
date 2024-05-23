//
//  LocalDataSourceImpl.swift
//  PetFlix
//
//  Created by BS1098 on 20/5/24.
//

import Foundation

class HomeLocalDataSourceImpl: HomeLocalDataSource {
    func getGenres() -> [Genre] {
        return [
            Genre(name: "Action", movies: [
                Movie(
                    title: "Inception",
                    details: "A thief who steals corporate secrets through the use of dream-sharing technology. A thief who steals corporate secrets through the use of dream-sharing technology.",
                    posterURL: URL(string: "https://image.tmdb.org/t/p/original/xlaY2zyzMfkhk0HSC5VUwzoZPU1.jpg")!,
                    ratings: 8.8,
                    yourRating: nil,
                    pg: "PG-13",
                    releaseYear: sampleDate,
                    runTime: sampleRunTime
                ),
                Movie(
                    title: "The Dark Knight",
                    details: "Batman faces the Joker, a criminal mastermind who wants to plunge Gotham City into anarchy. A thief who steals corporate secrets through the use of dream-sharing technology.",
                    posterURL: URL(string: "https://image.tmdb.org/t/p/w500//qJ2tW6WMUDux911r6m7haRef0WH.jpg")!,
                    ratings: 9.0,
                    yourRating: 10.0, 
                    pg: "PG-13",
                    releaseYear: sampleDate,
                    runTime: sampleRunTime
                ),
                Movie(
                    title: "Mad Max: Fury Road",
                    details: "In a post-apocalyptic wasteland, Max teams up with Furiosa to escape a tyrant. A thief who steals corporate secrets through the use of dream-sharing technology.",
                    posterURL: URL(string: "https://image.tmdb.org/t/p/w500//8tZYtuWezp8JbcsvHYO0O46tFbo.jpg")!,
                    ratings: 8.1,
                    yourRating: 8.0,
                    pg: "R",
                    releaseYear: sampleDate,
                    runTime: sampleRunTime
                )
            ]),
            Genre(name: "Drama", movies: [
                Movie(
                    title: "The Shawshank Redemption",
                    details: "Two imprisoned men bond over several years, finding solace and eventual redemption. A thief who steals corporate secrets through the use of dream-sharing technology.",
                    posterURL: URL(string: "https://image.tmdb.org/t/p/w500//q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg")!,
                    ratings: 9.3,
                    yourRating: nil,
                    pg: "R",
                    releaseYear: sampleDate,
                    runTime: sampleRunTime
                ),
                Movie(
                    title: "Forrest Gump",
                    details: "The presidencies of Kennedy and Johnson, the Vietnam War, and more through the eyes of an Alabama man. A thief who steals corporate secrets through the use of dream-sharing technology.",
                    posterURL: URL(string: "https://image.tmdb.org/t/p/w500//clolk7rB5lAjs41SD0Vt6IXYLMm.jpg")!,
                    ratings: 8.8,
                    yourRating: 8.0,
                    pg: "PG-13",
                    releaseYear: sampleDate,
                    runTime: sampleRunTime
                ),
                Movie(
                    title: "Fight Club",
                    details: "An insomniac office worker and a devil-may-care soap maker form an underground fight club. A thief who steals corporate secrets through the use of dream-sharing technology.",
                    posterURL: URL(string: "https://image.tmdb.org/t/p/w500//a26cQPRhJPX6GbWfQbvZdrrp9j9.jpg")!,
                    ratings: 8.8,
                    yourRating: 7.0,
                    pg: "R",
                    releaseYear: sampleDate,
                    runTime: sampleRunTime
                )
            ]),
            Genre(name: "Comedy", movies: [
                Movie(
                    title: "Superbad",
                    details: "Two co-dependent high school seniors are forced to deal with separation anxiety. A thief who steals corporate secrets through the use of dream-sharing technology.",
                    posterURL: URL(string: "https://image.tmdb.org/t/p/w500//ek8e8txUyUwd2BNqj6lFEerJfbq.jpg")!,
                    ratings: 7.6,
                    yourRating: nil,
                    pg: "R",
                    releaseYear: sampleDate,
                    runTime: sampleRunTime
                ),
                Movie(
                    title: "Step Brothers",
                    details: "Two aimless middle-aged losers still living at home are forced to become roommates. A thief who steals corporate secrets through the use of dream-sharing technology.",
                    posterURL: URL(string: "https://pbncanvas.com/wp-content/uploads/2022/02/Step-brothers-movie-Poster-paint-by-number-247x296.jpg")!,
                    ratings: 6.9,
                    yourRating: 6.0,
                    pg: "R",
                    releaseYear: sampleDate,
                    runTime: sampleRunTime
                ),
                Movie(
                    title: "The Hangover",
                    details: "Three buddies wake up from a bachelor party in Las Vegas with no memory of the previous night. A thief who steals corporate secrets through the use of dream-sharing technology.",
                    posterURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGDc_7BJU_Dyhp1vMyCWSRtPjsZu8jCxF9ATuLIlNxAA&s")!,
                    ratings: 7.7,
                    yourRating: nil,
                    pg: "R",
                    releaseYear: sampleDate,
                    runTime: sampleRunTime
                )
            ])
        ]
    }
    
    func getPopular() -> [Movie] {
        return [
                Movie(
                    title: "The Shawshank Redemption",
                    details: "Two imprisoned men bond over several years, finding solace and eventual redemption. A thief who steals corporate secrets through the use of dream-sharing technology.",
                    posterURL: URL(string: "https://image.tmdb.org/t/p/w500//q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg")!,
                    ratings: 9.3,
                    yourRating: 8.9,
                    pg: "R",
                    releaseYear: sampleDate,
                    runTime: sampleRunTime
                ),
                Movie(
                    title: "The Dark Knight",
                    details: "Batman faces the Joker, a criminal mastermind who wants to plunge Gotham City into anarchy. A thief who steals corporate secrets through the use of dream-sharing technology.",
                    posterURL: URL(string: "https://image.tmdb.org/t/p/w500//qJ2tW6WMUDux911r6m7haRef0WH.jpg")!,
                    ratings: 9.0,
                    yourRating: 8.0,
                    pg: "PG-13",
                    releaseYear: sampleDate,
                    runTime: sampleRunTime
                ),
                Movie(
                    title: "Inception",
                    details: "A thief who steals corporate secrets through the use of dream-sharing technology. A thief who steals corporate secrets through the use of dream-sharing technology.",
                    posterURL: URL(string: "https://image.tmdb.org/t/p/original/xlaY2zyzMfkhk0HSC5VUwzoZPU1.jpg")!,
                    ratings: 8.8,
                    yourRating: nil,
                    pg: "PG-13",
                    releaseYear: sampleDate,
                    runTime: sampleRunTime
                ),
                Movie(
                    title: "Mad Max: Fury Road",
                    details: "In a post-apocalyptic wasteland, Max teams up with Furiosa to escape a tyrant. A thief who steals corporate secrets through the use of dream-sharing technology.",
                    posterURL: URL(string: "https://image.tmdb.org/t/p/w500//8tZYtuWezp8JbcsvHYO0O46tFbo.jpg")!,
                    ratings: 8.1,
                    yourRating: nil,
                    pg: "R",
                    releaseYear: sampleDate,
                    runTime: sampleRunTime
                ),
        ]
    }
}


func makeDate(year: Int, month: Int, day: Int) -> Date {
    var dateComponents = DateComponents()
    dateComponents.year = year
    dateComponents.month = month
    dateComponents.day = day
    let calendar = Calendar.current
    return calendar.date(from: dateComponents) ?? Date()
}

func makeRunTime(hours: Int, minutes: Int) -> TimeInterval {
    return TimeInterval(hours * 3600 + minutes * 60)
}


let sampleMovie = Movie(
    title: "The Dark Knight",
    details: "Batman faces the Joker, a criminal mastermind who wants to plunge Gotham City into anarchy. A thief who steals corporate secrets through the use of dream-sharing technology.",
    posterURL: URL(string: "https://image.tmdb.org/t/p/w500//qJ2tW6WMUDux911r6m7haRef0WH.jpg")!,
    ratings: 9.0,
    yourRating: 8.0,
    pg: "PG-13",
    releaseYear: sampleDate,
    runTime: sampleRunTime
)

let sampleDate = makeDate(year: 2020, month: 1, day: 1)
let sampleRunTime = makeRunTime(hours: 2, minutes: 15)



