//
//  Movie.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/27/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import Foundation
import ObjectMapper

class MoviesResponse: Mappable {
    
    var movies: [Movie]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        movies <- map["results"]
    }
}


class Movie: Mappable{
    
    
    static var userDateFormatter: DateFormatter{
        get{
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter
        }
    }
    
    var id: Int!
    var voteCount: Int?
    var video: Bool = false
    var adult: Bool = false
    var genreIds: [Int] = []
    var genres: [Genre] = []
    var videos: [Video] = []
    var spokenLanguages: [SpokenLanguage] = []
    var productionCountries: [ProductionCountry] = []
    var productionCompanies: [ProductionCompany] = []
    var title: String = ""
    var posterPath: String?
    var backdropPath: String?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var releaseDate: Date?
    var homepage: URL?
    
    
    func trailerVideo() -> Video?{
        return videos.first(where: { return $0.type == "Trailer" })
    }
    
    
    func releaseDateDescription() -> String?{
        
        guard let releaseDate = releaseDate else { return nil }
        return Movie.userDateFormatter.string(from: releaseDate)
        
    }
    
    func releaseAge() -> String?{
        
        guard let releaseDate = releaseDate else { return nil }
        guard let year = Calendar.current.dateComponents([.year], from: releaseDate).year else { return nil }
        
        return String(year)
    }
    
    func thumbnailPosterUrl() -> URL?{
        guard let posterPath = posterPath else { return nil }
        return URL(string: "\(apiImageBaseUrl)/t/p/w185\(posterPath)")
    }
    
    func posterUrl() -> URL?{
        guard let posterPath = posterPath else { return nil }
        return URL(string: "\(apiImageBaseUrl)/t/p/w500\(posterPath)")
    }
    
    func thumbnailBackdropUrl() -> URL?{
        guard let backdropPath = backdropPath else { return nil }
        return URL(string: "\(apiImageBaseUrl)/t/p/h100\(backdropPath)")
    }
    
    func backdropUrl() -> URL?{
        guard let backdropPath = backdropPath else { return nil }
        return URL(string: "\(apiImageBaseUrl)/t/p/w500\(backdropPath)")
    }
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        
        id                 <- map["id"]
        voteCount          <- map["vote_count"]
        video              <- map["video"]
        adult              <- map["adult"]
        title              <- map["original_title"]
        posterPath         <- map["poster_path"]
        backdropPath       <- map["backdrop_path"]
        originalLanguage   <- map["original_language"]
        originalTitle      <- map["original_title"]
        overview           <- map["overview"]
        genreIds           <- map["genre_ids"]
        genres           <- map["genres"]
        videos           <- map["videos.results"]
        spokenLanguages           <- map["spoken_languages"]
        productionCompanies           <- map["production_companies"]
        productionCountries           <- map["production_countries"]
        genres             <- map["genres"]
        homepage           <- map["homepage"]
        releaseDate        <- (map["release_date"], DateFormatTransform())
    }
    
}

public class DateFormatTransform: TransformType {
    
    public typealias Object = Date
    public typealias JSON = String
    
    public func transformFromJSON(_ value: Any?) -> Date? {
        if let dateString = value as? String {
            return Updater.serverDateFormatter.date(from: dateString)
        }
        return nil
    }
    
    public func transformToJSON(_ value: Date?) -> String? {
        if let date = value{
            return Updater.serverDateFormatter.string(from: date)
        }
        return nil
    }
}


