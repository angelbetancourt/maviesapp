//
//  Updater.swift
//  Moviesapp
//
//  Created by Angel Betancourt on 4/27/18.
//  Copyright © 2018 Angel Betancourt. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

let apiBaseUrl = "https://api.themoviedb.org/3"
let apiImageBaseUrl = "https://image.tmdb.org"
let apiKey = "a24eb3f5615f233a658e24208e9289e6"

struct Router{
    
    static let mostPopular = "/discover/movie?sort_by=popularity.desc"
    static let topRated = "/discover/movie/?sort_by=vote_average.desc"
    static let upcoming = "/discover/movie?primary_release_date.gte=%@"
    
    static let search = "/search/movie?query=%@"
    
    static let movie = "/movie/%@"
    
}

struct Updater {
    
    static var serverDateFormatter = DateFormatter(withFormat: "yyyy-MM-dd", locale: "")

    //let cachePolicy: NSURLRequest.CachePolicy = Reachability.isConnectedToNetwork() ? .reloadIgnoringLocalCacheData : .returnCacheDataElseLoad

    
    
    static func fetchMostPopularMovies(_ completion: ((_ movies: [Movie]?, _ error: Error?) -> Void )? ){
    
        let url = apiBaseUrl + Router.mostPopular + "&append_to_response=videos&api_key=\(apiKey)"
        
        Alamofire.request(url).validate().responseObject { (response: DataResponse<MoviesResponse>) in
            
            switch response.result {
                
            case .success:
                completion?(response.result.value?.movies, nil)
                cacheResponse(response)
                
            case .failure(let error):
                completion?([], error)
            }
        }
    }
    
    
    static func fetchTopRatedMovies(_ completion: ((_ movies: [Movie]?, _ error: Error?) -> Void )? ){
        
        let url = apiBaseUrl + Router.topRated + "&api_key=\(apiKey)"
        
        Alamofire.request(url).validate().responseObject { (response: DataResponse<MoviesResponse>) in
            
            cacheResponse(response)
            
            switch response.result {
                
            case .success:
                completion?(response.result.value?.movies, nil)
                cacheResponse(response)
                
            case .failure(let error):
                completion?([], error)
            }
        }
    }
    
    
    static func fetchUpcomingMovies(_ completion: ((_ movies: [Movie]?, _ error: Error?) -> Void )? ){
        
        let upcomingPatch = String(format: Router.upcoming, serverDateFormatter.string(from: Date()))
        
        let url = apiBaseUrl + upcomingPatch + "&api_key=\(apiKey)"
        
        Alamofire.request(url).validate().responseObject { (response: DataResponse<MoviesResponse>) in
            
            
            switch response.result {
                
            case .success:
                completion?(response.result.value?.movies, nil)
                cacheResponse(response)
                
            case .failure(let error):
                completion?([], error)
            }
        }
    }
    
    
    static func searchMovies(_ query: String, completion: ((_ movies: [Movie]?, _ error: Error?) -> Void )? ){
        
        let patch = String(format: Router.search, query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        
        let url = apiBaseUrl + patch + "&api_key=\(apiKey)"
        
        Alamofire.request(url).validate().responseObject { (response: DataResponse<MoviesResponse>) in
            
            switch response.result {
                
            case .success:
                completion?(response.result.value?.movies, nil)
                cacheResponse(response)
                
            case .failure(let error):
                completion?([], error)
            }
        }
    }
    
    static func fetchMovie(_ movieId: Int, completion: ((_ movie: Movie?, _ error: Error?) -> Void )? ){
        
        let patch = String(format: Router.movie, "\(movieId)")
        
        let url = apiBaseUrl + patch + "?api_key=\(apiKey)&append_to_response=videos"
        
        Alamofire.request(url).validate().responseObject { (response: DataResponse<Movie>) in
            
            switch response.result {
                
            case .success:
                completion?(response.result.value, nil)
                //cacheResponse(response)
                
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
    
    
    static func cacheResponse(_ response: DataResponse<MoviesResponse>){
        
        if let urlResponse = response.response, let data = response.data, let request = response.request{
            let cachedURLResponse = CachedURLResponse(response: urlResponse, data: data, userInfo: nil, storagePolicy: .allowed)
            URLCache.shared.storeCachedResponse(cachedURLResponse, for: request)
            
        }
    }
}
