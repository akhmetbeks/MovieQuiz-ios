//
//  MoviesLoader.swift
//  MovieQuiz
//
//  Created by Sultan Akhmetbek on 18.04.2025.
//

import Foundation

protocol MoviesLoading {
    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void)
}

struct MoviesLoader: MoviesLoading {
    private let networkClient: NetworkRouting
    
    init(networkClient: NetworkRouting = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    private var mostPopularMoviewUrl: URL {
        guard let url = URL(string: "https://tv-api.com/en/API/MostPopularTVs/k_zcuw1ytf") else {
            preconditionFailure("Unable to construct mostPopularMoviesUrl")
        }
        
        return url
    }
    
    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void) {
        networkClient.fetch(url: mostPopularMoviewUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let movies = try JSONDecoder().decode(MostPopularMovies.self, from: data)
                    if movies.errorMessage != "" {
                        let error = NSError(domain: "MovieQuizErrorDomain", code: 200, userInfo: [NSLocalizedDescriptionKey : movies.errorMessage])
                        handler(.failure(error))
                        return
                    }
                    handler(.success(movies))
                } catch let decodingError as DecodingError {
                    handler(.failure(decodingError))
                } catch {
                    handler(.failure(error))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
